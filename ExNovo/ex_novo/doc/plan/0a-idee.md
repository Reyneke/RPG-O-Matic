# ExNovo App — Konzept

## Vision

Das Regelwerk von **ExNovo** (siehe [Quelle](#quelle)) als Grundlage nutzend, entsteht eine digitale App, die das analoge Spielerlebnis unterstützt und erweitert. Die App soll das Kartenzeichnen, Würfeln und Nachschlagen von Tabellen digitalisieren, ohne die kreative Freiheit und den kollaborativen Charakter des Spiels zu verlieren.

## Ziele

- **Digitale Unterstützung** des kompletten Spielablaufs (Setup-, Gründungs-, Entwicklungs- und Abschlussphase)
- **Würfelmechanik** für alle Tabellen (D6, 2D6, D66, D666) mit automatischer Ergebnisauswertung
- **Digitale Karte** zum Zeichnen von Regionen, Gelände, Wahrzeichen, Ressourcen und Bezirken
- **Token-Verwaltung** für Bürger- und Macht-Token inkl. Wachstumspool
- **Fraktionen & Zeitleiste** als digitale Karteikarten mit Verlaufshistorie
- **Kollaborativer Modus** für 1–4 Spieler (lokal und/oder online)

## Nicht-Ziele (v1)

- Keine künstliche Intelligenz für automatische Interpretation von Ereignissen
- Kein Ersatz für die kreative Entscheidungsfindung der Spieler
- Kein Cloud-/Online-Multiplayer in v1 — zunächst nur lokaler Hot-Seat-Modus *(wird in Phase 4 überarbeitet — Online ist erwünscht)*

## Entwicklungsschritte

### Phase 1: Grundlagen

- [ ] Projektstruktur (Flutter) aufsetzen und konfigurieren
- [ ] Regelwerk-Datenmodell definieren (Tabellen, Ereignisse, Aktionen)
- [ ] Tabellen aus `doc/rules/ExNovo.md` in maschinenlesbares Format überführen (z. B. JSON/YAML)
- [ ] Grundlegende Navigation und App-Shell implementieren

### Phase 2: Kernfunktionen

- [ ] Würfelmechanik implementieren (D6, 2D6, D66, D666) mit Ergebnisauswertung
- [ ] Tabellen-Browser mit Such- und Filterfunktion
- [ ] Spielzustandsverwaltung (Phasen, aktiver Spieler, Zeitleiste)
- [ ] Token-Verwaltung (Bürger-, Macht-Token, Wachstumspool)

### Phase 3: Kartenfunktion

- [ ] Digitale Kartenfläche mit Zeichenwerkzeugen (Regionen, Gelände, Wahrzeichen, Ressourcen, Bezirke)
- [ ] Benennung und Beschriftung von Features
- [ ] Token auf der Karte platzieren und verschieben
- [ ] Karten exportieren/importieren (z. B. als Bild oder JSON)

### Phase 4: Kollaboration & Verfeinerung

- [ ] Lokaler Mehrspielermodus (Hot-Seat)
- [ ] Online-Mehrspielermodus (optional, falls gewünscht)
- [ ] Fraktions- und Zeitleisten-Verwaltung mit Historie
- [ ] Speichern/Laden von Spielständen
- [ ] UI/UX-Verfeinerung und Barrierefreiheit

### Phase 5: Qualität & Release

- [ ] Automatisierte Tests (Unit- und Widget-Tests)
- [ ] Dokumentation und Benutzerhandbuch
- [ ] Beta-Test mit Spielergruppe
- [ ] Veröffentlichung (z. B. Web, Android, iOS)

## Technologie

- **Framework:** Flutter (bestehende Projektstruktur)
- **Sprache:** Dart
- **Plattformen:** Web, Android, iOS (durch Flutter abgedeckt)
- **Datenhaltung:** Lokal (z. B. SQLite/JSON) — keine Cloud

## Quelle

- [doc/rules/ExNovo.md](../rules/ExNovo.md) — Regelwerk "Ex Novo — Second Edition" von Martin Nerurkar & Konstantinos Dimopoulos