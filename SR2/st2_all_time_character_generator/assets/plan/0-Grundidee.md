# Konzept: Shadowrun 2. Edition Charaktergenerator

## Übersicht

Da es derzeit keinen dedizierten Charaktergenerator für Shadowrun 2. Edition gibt, soll diese App diese Lücke füllen. Als Inspiration und Referenz dient Chummer 5a, der etablierte Charaktergenerator für Shadowrun 5. Edition.

## Zielgruppe

- Shadowrun 2. Edition Spieler (Tisch und online)
- Spielleiter (SL) für die Erstellung von NSC, Crittern und Orten
- Neu- und Wiedereinsteiger, die eine benutzerfreundliche Unterstützung suchen
- Neurodivergente Spieler, die von spezialisierten Cheatsheets profitieren

## Kernfunktionen

### Charaktererstellung
- Vollständige Erstellung von Spielercharakteren (SCs) für Shadowrun 2. Edition
- Regelkonforme Erstellung mit allen verfügbaren Optionen und Anpassungsmöglichkeiten
- Zwei Betriebsmodi:
  - **Erstellungsmodus**: Nutzung aller Regeln und Systeme zur Charaktererschaffung
  - **Ingame-Modus**: Erfassung von Veränderungen und Fortschritten während der Karriere

### Ausrüstungsverwaltung
- Erstellung und Verwaltung von Ausrüstung (Waffen, Rüstung, Cyberware, etc.)
- Fahrzeug-Erstellung und -Verwaltung
- Zuweisung von Ausrüstung zu Charakteren

### NSC- und Critter-Erstellung
- Schnelle und einfache Erstellung von Nicht-Spieler-Charakteren (NSCs)
- Critter-Erstellung nach Regeln
- Unterstützung für weitere Entitäten (Geister, Drachen, etc.)

### Host-Erstellung
- Erstellung von Matrix-Hosts für Shadowrun 2. Edition
- Konfiguration von Host-Attributen und -Systemen

### Location-Erstellung
- Schnelle Erstellung von Orten und Schauplätzen
- Verwaltung von Umgebungsinformationen

### Cheatsheet-Generator
- Automatische Generierung von Regelübersichten
- Neurodivergenz-freundliche Darstellung (vereinfachte, strukturierte Regeldarstellung)
- Anpassbare Cheatsheets für verschiedene Spielsituationen

## Exportformate

Die erstellten Inhalte werden in verschiedenen Formaten exportiert:

- **PDF**: Charakterbögen und Ausrüstungslisten zum Ausdrucken
- **Roll20**: Kompatibles Dateiformat für das Online-Tool
- **JSON**: Standardisiertes Format für Datenaustausch und Backup
- **Foundry VTT JSON**: Kompatibel mit dem Foundry Virtual Tabletop

## Technische Rahmenbedingungen

### Referenzmaterial
- Alle Regelwerke befinden sich im Ordner `assets/pdf`
- Die App orientiert sich strikt an den offiziellen Shadowrun 2. Edition Regeln

### Datenspeicherung
- Jeder Charakter wird als eigenständiges Projekt behandelt (wie bei Chummer)
- Lokale Speicherung in nutzerdefinierten Ordnern
- Volle Kontrolle über die Datenhaltung durch den Nutzer
- Keine Cloud-Abhängigkeit für Grundfunktionen

### Architektur
- Orientierung an Chummer 5a als bewährtes Vorbild
- Modulare Architektur für einfache Erweiterbarkeit
- Plattformübergreifende Verfügbarkeit (Desktop, ggf. Mobile)

## Nicht-Ziele (Out of Scope)

- Regelinterpretation oder -erweiterungen
- Offizielle Regelanpassungen oder House Rules als Standard
- Multiplayer-Funktionalität oder Online-Synchronisation
- Integration mit anderen Charaktergeneratoren

## Erfolgskriterien

- [ ] Vollständige Implementierung der Charaktererstellung für Shadowrun 2. Edition
- [ ] Alle geplanten Exportformate funktionieren korrekt
- [ ] Benutzerfreundliche Oberfläche mit intuitiver Bedienung
- [ ] Cheatsheets sind neurodivergenz-freundlich gestaltet
- [ ] Lokale Datenspeicherung funktioniert zuverlässig
- [ ] Referenzierung aller Regeln aus den PDF-Quellen

## Nächste Schritte

1. Detaillierte Anforderungsanalyse der Shadowrun 2. Edition Regeln
2. Architektur-Entwurf und Technologie-Stack festlegen
3. Datenmodelle für Charaktere, Ausrüstung, NSC, Hosts und Locations definieren
4. UI/UX-Design erstellen
5. Implementierung in Iterationen (MVP → Erweiterungen)