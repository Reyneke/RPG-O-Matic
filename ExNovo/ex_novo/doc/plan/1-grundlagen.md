# Phase 1: Grundlagen

## Aufgaben

- [ ] Projektstruktur (Flutter) aufsetzen und konfigurieren
- [ ] Regelwerk-Datenmodell definieren (Tabellen, Ereignisse, Aktionen)
- [ ] Tabellen aus `doc/rules/ExNovo.md` in maschinenlesbares Format überführen (z. B. JSON/YAML)
- [ ] Grundlegende Navigation und App-Shell implementieren

## Begrenzungen

### Zielplattformen

- **Web** — primäre Plattform, einfacher Zugang ohne Installation
- **Desktop** (Windows, macOS, Linux) — für komfortables Kartenzeichnen mit Maus/Stift
- **Mobile** (Android, iOS) — für unterwegs, Touch-optimiert

### Barrierefreiheit

- Die App soll von **neurodivergenten Personen** nutzbar sein:
  - Reduzierte visuelle Ablenkung (klare Layouts, optionaler Fokus-Modus)
  - Anpassbare Schriftgrößen und Kontraste
  - Vermeidung von blinkenden Animationen und abrupten Übergängen
  - Klare, eindeutige Sprache in allen Texten
  - Konsistente Navigation ohne versteckte Gesten

### Dokumentation

- **Klare, ausführliche Dokumentation von Anfang an**:
  - Architektur- und Datenmodell-Dokumentation
  - Benutzerhandbuch parallel zur Entwicklung
  - Code-Kommentare und README aktuell halten

## Probleme

### Technische Risiken

- **Komplexität des Regelwerks:** Die Tabellen und Aktionen von ExNovo sind vielschichtig (D6, 2D6, D66, D666, optionale Aktionen, Token-Bewegungen). Ein fehlerhaftes Datenmodell führt zu inkonsistentem Spielverhalten.
- **Kartenzeichnung auf verschiedenen Plattformen:** Touch- vs. Maus-Interaktion erfordert unterschiedliche Gesten und Werkzeuge. Die Zeichen-Performance auf mobilen Geräten kann bei komplexen Karten leiden.
- **Datenmigration:** Wenn sich das Regelwerk-Datenmodell ändert, müssen gespeicherte Spielstände migrierbar bleiben.

### Design-Herausforderungen

- **Balance zwischen Digital und Analog:** Die App soll das Spiel unterstützen, nicht die kreative Freiheit einschränken. Zu viel Automatisierung kann das Erlebnis verflachen.
- **Kollaboration:** Lokaler Hot-Seat-Modus ist einfach, aber Online-Multiplayer (Echtzeit-Synchronisation) ist deutlich komplexer und sollte erst in einer späteren Phase angegangen werden.
- **Barrierefreiheit vs. Komplexität:** Die vielen Interaktionsmöglichkeiten (Zeichnen, Token, Tabellen) müssen für neurodivergente Nutzer zugänglich bleiben, ohne die Funktionalität einzuschränken.

## Entscheidungen

| Frage | Entscheidung |
|---|---|
| Soll die App das Regelwerk vollständig abbilden? | **Ja, vollständig.** Alle Tabellen, Aktionen und Regeln werden abgebildet. |
| Wie detailliert soll die digitale Karte sein? | **Freies Zeichnen und Formen** — beide Nutzergruppen werden angesprochen. |
| Soll es einen "Stadt-Export" geben? | **Ja.** Das gesamte Projekt wird lokal gespeichert und mit Texten und allem exportierbar. |
| Wie werden optionale Aktionen (in Klammern) dargestellt? | **Mit Hinweis und Option** — sie können ausgeführt werden, aber ohne Zwang (anders als normale Aktionen). |
| Soll die App mehrsprachig sein? | **Deutsch und Englisch** — vorerst ausreichend. |
| Wie wird der Wachstumspool visualisiert? | **Als separates Panel.** |
| Soll es ein Tutorial/Onboarding geben? | **Später, ja.** |
| Welche Datenhaltung wird verwendet? | **Lokal** (keine Cloud). |