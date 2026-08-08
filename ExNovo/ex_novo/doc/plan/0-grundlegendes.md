# Grundlegendes

## Konzept

Die Datei `assets/.basepdf/ExNovo.pdf` wird eingelesen und in eine gleichnamige Markdown-Datei umgewandelt. Die erzeugte Markdown-Datei wird anschließend im Ordner `doc/rules` abgelegt.

## Ziel

- **Eingabe**: `assets/.basepdf/ExNovo.pdf`
- **Ausgabe**: `doc/rules/ExNovo.md`
- **Zweck**: Die Regeln des Spiels "ExNovo" als versionierbare, durchsuchbare Markdown-Datei bereitstellen.

## Ablauf

1. **Einlesen**: Die PDF-Datei `assets/.basepdf/ExNovo.pdf` wird eingelesen.
2. **Konvertierung**: Der Inhalt der PDF-Datei wird in das Markdown-Format umgewandelt.
3. **Ablage**: Die erzeugte Markdown-Datei (mit demselben Namen wie die PDF-Datei) wird unter `doc/rules/` gespeichert.

## Anforderungen

### Dateibenennung

- Die Ausgabedatei trägt denselben Dateinamen wie die Eingabedatei, jedoch mit der Endung `.md`.
  - Beispiel: `ExNovo.pdf` → `ExNovo.md`

### Zielordner

- Der Zielordner `doc/rules` muss bei Bedarf angelegt werden (idempotent, d. h. kein Fehler, wenn er bereits existiert).

### Copyright & Gitignore

- Das PDF ist aus Copyrightgründen **nicht** in der Versionskontrolle zu führen.
- Der folgende Eintrag muss in `.gitignore` aufgenommen werden:

  ```gitignore
  # Copyright-geschützte PDF-Dateien
  assets/.basepdf/
  ```

- **Hinweis**: Der Eintrag ist aktuell noch nicht in `.gitignore` vorhanden und muss ergänzt werden.

## Technische Hinweise

- **Konvertierungswerkzeug**: Noch zu bestimmen (z. B. `pdftotext`, `marker`, `pandoc` oder ein Dart/Flutter-Paket).
- **Formatierung**: Die Ausgabe soll die Struktur des PDFs (Überschriften, Listen, Tabellen) so weit wie möglich erhalten.
- **Fehlerbehandlung**: Falls die Eingabedatei nicht existiert oder nicht lesbar ist, soll ein klarer Fehler ausgegeben werden.

## Abnahmekriterien

- [ ] `doc/rules/ExNovo.md` existiert nach der Ausführung.
- [ ] Die Markdown-Datei enthält den vollständigen Inhalt des PDFs.
- [ ] Der Eintrag `assets/.basepdf/` ist in `.gitignore` vorhanden.
- [ ] Die PDF-Datei wird von Git ignoriert (`git check-ignore assets/.basepdf/ExNovo.pdf` liefert die Datei zurück).

Addendum
Die PDF Datei als Quelle nutzend, ist "ExNovo.md" zu überarbeiten und in ein lesbares Format zu übersetzen.