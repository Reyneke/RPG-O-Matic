# Phase 5: Qualität & Release

## Aufgaben

- [ ] Automatisierte Tests (Unit- und Widget-Tests)
- [ ] Dokumentation und Benutzerhandbuch
- [ ] Beta-Test mit Spielergruppe
- [ ] Veröffentlichung (z. B. Web, Android, iOS)

## Begrenzungen

- **Alle bisherigen Entscheidungen beachten und ggf. anpassen** (siehe Phasen 1–4):
  - Vollständige Abbildung des Regelwerks
  - Freies Zeichnen und Formen auf der Karte
  - Lokale Speicherung und vollständiger Export
  - Optionale Aktionen mit Hinweis, ohne Zwang
  - Deutsch und Englisch
  - Wachstumspool als separates Panel
  - Datenhaltung lokal (keine Cloud)
  - Online-Multiplayer als Server/Client (user-gehostet, lokal)
  - Hot-Seat offline nutzbar
  - Fraktionen und Zeitleiste als Karteikarten
  - Automatische Spielhistorie/Chronik (für Export)
  - Undo-Funktion nach Phase
  - Fokus-Modus, anpassbare Farben/Kontraste, Tastatur-Shortcuts

### Technische Anforderungen

- **Würfelmechanik-Tests:** Deterministisch testbar (siehe Phase 2) — alle Würfeltypen (D6, 2D6, D66, D666) müssen korrekt abgedeckt sein
- **Token-Validierung:** Automatische Validierung testen (Bürger-Token nur auf Bezirke, Macht-Token auf Features/Fraktionen)
- **Export/Import-Tests:** Verlustfreie Exporte (PDF, JSON, SVG, PNG) und Imports fremder Projekte
- **Mehrsprachigkeit:** Tests für Deutsch und Englisch
- **Dokumentation:** Klare, ausführliche Dokumentation von Anfang an (siehe Phase 1)
- **Barrierefreiheit:** Tests unter Berücksichtigung der Anforderungen aus Phase 1

## Probleme

### Technische Risiken

- **Testabdeckung des Regelwerks:** Das vollständige Regelwerk mit all seinen Regeln, Tabellen und Aktionen muss getestet werden. Fehlerhafte Tests oder fehlende Abdeckung führen zu inkonsistentem Spielverhalten.
- **Plattform-Vielfalt:** Die App muss auf Web, Desktop (Windows, macOS, Linux) und Mobile (Android, iOS) getestet werden. Jede Plattform hat eigene Besonderheiten (Touch, Auflösung, Performance).
- **Online-Multiplayer-Tests:** Server/Client-Synchronisation, Latenz und Verbindungsabbrüche müssen getestet werden. Dies ist deutlich aufwendiger als lokale Tests.
- **Datenmigration:** Gespeicherte Spielstände müssen bei Updates migrierbar bleiben (siehe Phase 1).
- **Export-Korrektheit:** Die Exportformate (PDF, JSON, SVG, PNG) müssen verlustfrei und druckbar sein.

### Design-Herausforderungen

- **Dokumentation aktuell halten:** Die Dokumentation muss parallel zur Entwicklung gepflegt werden — nicht erst am Ende.
- **Beta-Test-Organisation:** Eine Spielergruppe muss organisiert, Feedback gesammelt und priorisiert werden.
- **Release-Koordination:** Die Veröffentlichung auf mehreren Plattformen (Web, Android, iOS) erfordert Koordination (App-Store-Richtlinien, Versionierung, Signierung).
- **Barrierefreiheit testen:** Wie wird die Barrierefreiheit verifiziert (z. B. mit Screenreader)?

## Entscheidungen

| Frage | Entscheidung |
|---|---|
| Welche Test-Frameworks werden verwendet? | **`flutter_test` und `integration_test`** sowie weitere, die sich als praktisch erweisen. |
| Soll es automatische CI/CD-Pipelines geben? | **Ja** — GitHub Actions. |
| Wie hoch soll die Testabdeckung sein? | **80–90 %.** |
| Auf welchen Plattformen sollen Tests laufen? | **Desktop und Web** — vorerst ausreichend. |
| Welche Dokumentationsformate werden verwendet? | **Markdown und API-Docs.** |
| Soll das Benutzerhandbuch Teil der App sein? | **Ja** — z. B. als eingebautes Help-Menü. |
| In welchen Sprachen wird die Dokumentation verfasst? | **Beides** — Deutsch und Englisch. |
| Wie viele Beta-Tester werden benötigt? | **4.** |
| Wie wird Feedback gesammelt? | **Tracker und Fragebögen.** |
| Wie lange soll die Beta-Phase dauern? | **Grob 4 Wochen.** |
| Soll die Beta öffentlich oder geschlossen sein? | **Offen.** |
| Auf welchen Plattformen wird zuerst veröffentlicht? | **Zuerst Web** (Hosting auf GitHub), dann Desktop. |
| Welche Versionierungsstrategie wird verwendet? | **SemVer** — bereits in Verwendung (`0.1.0+1` in `pubspec.yaml`, Format `major.minor.patch+build`). |
| Soll die App in App-Stores veröffentlicht werden? | **Sowohl als auch** — App-Stores und Download/Web-App. |
| Gibt es rechtliche Vorgaben? | **Ja** — ExNovo gehört **Sharkbomb Games**. Kontaktaufnahme und ggf. Lizenzierung/Abstimmung sind erforderlich. | => Wird erledigt
