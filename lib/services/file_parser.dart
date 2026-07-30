import 'dart:io';
import 'package:xml/xml.dart';
import 'dart:convert';

/// Ergebnis einer Dateiverarbeitung.
class ParseResult {
  final String systemName;
  final String? detectedVersion;
  final Map<String, dynamic>? extractedData;
  final bool success;
  final String? errorMessage;

  ParseResult({
    required this.systemName,
    this.detectedVersion,
    this.extractedData,
    required this.success,
    this.errorMessage,
  });
}

/// Service zum Verarbeiten verschiedener Dateiformate.
class FileParser {
  /// Validiert, ob ein Dateityp unterstützt wird.
  static bool isSupported(String filePath) {
    final ext = filePath.toLowerCase();
    return supportedExtensions.any((e) => ext.endsWith(e));
  }

  static const supportedExtensions = [
    '.pdf', '.md', '.json', '.xml',
    '.docx', '.doc', '.rtf', '.odt',
    '.txt',
  ];

  /// Parst eine Datei und extrahiert Systeminformationen.
  Future<ParseResult> parse(String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        return ParseResult(
          systemName: _extractName(filePath),
          success: false,
          errorMessage: 'Datei nicht gefunden: $filePath',
        );
      }

      final ext = filePath.toLowerCase();
      String text;

      if (ext.endsWith('.txt') || ext.endsWith('.md')) {
        text = await file.readAsString();
      } else if (ext.endsWith('.json')) {
        text = await file.readAsString();
        return _parseJson(text, _extractName(filePath));
      } else if (ext.endsWith('.xml')) {
        text = await file.readAsString();
        return _parseXml(text, _extractName(filePath));
      } else if (ext.endsWith('.pdf')) {
        return _parseTextFile(file, _extractName(filePath));
      } else if (ext.endsWith('.docx') || ext.endsWith('.doc') ||
                 ext.endsWith('.rtf') || ext.endsWith('.odt')) {
        // Für Word/RTF/ODT: Rohtext-Extraktion
        return _parseTextFile(file, _extractName(filePath));
      } else {
        return ParseResult(
          systemName: _extractName(filePath),
          success: false,
          errorMessage: 'Nicht unterstütztes Format: $ext',
        );
      }

      // Allgemeine Textextraktion und Struktur-Erkennung
      return _analyzeText(text, _extractName(filePath));
    } catch (e) {
      return ParseResult(
        systemName: _extractName(filePath),
        success: false,
        errorMessage: 'Fehler beim Verarbeiten: $e',
      );
    }
  }

  /// Extrahiert den Dateinamen ohne Pfad und Extension.
  String _extractName(String filePath) {
    final fileName = filePath.split('\\').last.split('/').last;
    return fileName.replaceAll(RegExp(r'\.[^.]+$'), '');
  }

  /// Parst eine JSON-Datei und extrahiert Systemstruktur.
  ParseResult _parseJson(String content, String defaultName) {
    try {
      final data = jsonDecode(content) as Map<String, dynamic>;
      final name = data['name'] as String? ?? data['system'] as String? ?? defaultName;
      final version = data['version'] as String?;

      return ParseResult(
        systemName: name,
        detectedVersion: version,
        extractedData: data,
        success: true,
      );
    } catch (e) {
      return ParseResult(
        systemName: defaultName,
        success: false,
        errorMessage: 'JSON-Parsing-Fehler: $e',
      );
    }
  }

  /// Parst eine XML-Datei und extrahiert Systemstruktur.
  ParseResult _parseXml(String content, String defaultName) {
    try {
      final doc = XmlDocument.parse(content);
      final root = doc.rootElement;

      final name = root.getAttribute('name') ??
                   root.findElements('name').firstOrNull?.innerText ??
                   defaultName;
      final version = root.getAttribute('version') ??
                      root.findElements('version').firstOrNull?.innerText;

      return ParseResult(
        systemName: name,
        detectedVersion: version,
        extractedData: {'xml_root': root.name.toString()},
        success: true,
      );
    } catch (e) {
      return ParseResult(
        systemName: defaultName,
        success: false,
        errorMessage: 'XML-Parsing-Fehler: $e',
      );
    }
  }

  /// Einfache Textextraktion aus Binärformaten (PDF, Word, etc.).
  Future<ParseResult> _parseTextFile(File file, String defaultName) async {
    try {
      // Lese als Bytes und versuche UTF-8-Dekodierung
      final bytes = await file.readAsBytes();
      final text = utf8.decode(bytes, allowMalformed: true);
      return _analyzeText(text, defaultName);
    } catch (e) {
      return ParseResult(
        systemName: defaultName,
        success: false,
        errorMessage: 'Text-Extraktion fehlgeschlagen: $e',
      );
    }
  }

  /// Analysiert Rohtext auf Systemstruktur.
  ParseResult _analyzeText(String text, String defaultName) {
    final lines = text.split('\n').where((l) => l.trim().isNotEmpty).toList();
    if (lines.isEmpty) {
      return ParseResult(
        systemName: defaultName,
        success: true,
        extractedData: {'isEmpty': true},
      );
    }

    // Versuche, den Systemnamen aus der ersten Zeile zu extrahieren
    String name = defaultName;
    String? version;

    // Erste Zeile: oft Überschrift oder Name
    if (lines.first.contains('#')) {
      // Markdown-Überschrift
      name = lines.first.replaceAll('#', '').trim();
    } else if (lines.first.contains('Version') || lines.first.contains('v')) {
      final parts = lines.first.split(RegExp(r':|;'));
      name = parts.first.trim();
      if (parts.length > 1) version = parts.last.trim();
    }

    // Versuche Versionsinfo in den ersten 10 Zeilen zu finden
    final versionRegex = RegExp(r'(Version|v)[:\s]*([\d.]+)', caseSensitive: false);
    for (final line in lines.take(10)) {
      final match = versionRegex.firstMatch(line);
      if (match != null) {
        version = match.group(2);
        break;
      }
    }

    // Extrahiere Grundstruktur aus Überschriften
    final headings = lines
        .where((l) => l.trimLeft().startsWith('#'))
        .map((l) => l.replaceAll('#', '').trim())
        .where((h) => h.isNotEmpty)
        .toList();

    final structure = <String, dynamic>{
      'lineCount': lines.length,
      'headings': headings,
      if (version != null) 'version': version,
    };

    return ParseResult(
      systemName: name,
      detectedVersion: version,
      extractedData: structure,
      success: true,
    );
  }
}