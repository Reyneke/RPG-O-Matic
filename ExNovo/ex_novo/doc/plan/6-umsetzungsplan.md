# Umsetzungsplan

## Plan

Der Umsetzungsplan fasst die Aufgaben, Entscheidungen und Abhängigkeiten der fünf Entwicklungsphasen zusammen. Jede Phase baut auf der vorherigen auf — die Reihenfolge ist daher verbindlich.

| Phase | Fokus | Abhängigkeiten | Geschätzte Dauer |
|---|---|---|---|
| [Phase 1](1-grundlagen.md) | Grundlagen & Datenmodell | — | 2–3 Wochen |
| [Phase 2](2-kernfunktionen.md) | Würfel, Tabellen, Spielzustand, Token | Phase 1 | 3–4 Wochen |
| [Phase 3](3-kartenfunktion.md) | Kartenfunktion & Export/Import | Phase 1, 2 | 4–5 Wochen |
| [Phase 4](4-kollaborationUverfeinerung.md) | Multiplayer, Speichern, UI/UX | Phase 1–3 | 5–6 Wochen |
| [Phase 5](5-qualitaetUrelease.md) | Tests, Doku, Beta, Release | Phase 1–4 | 5–6 Wochen |

**Gesamt:** ca. 20–24 Wochen (5–6 Monate)

### Meilensteine

1. **M1 (nach Phase 1):** Projektstruktur & Regelwerk-Datenmodell stehen. Tabellen aus `doc/rules/ExNovo.md` sind maschinenlesbar.
2. **M2 (nach Phase 2):** Alle Kernfunktionen nutzbar — Würfeln, Tabellen-Browser, Spielzustand, Token-Verwaltung.
3. **M3 (nach Phase 3):** Karte zeichnen, Features benennen, Token platzieren, Export/Import funktionsfähig.
4. **M4 (nach Phase 4):** Hot-Seat & Online-Multiplayer, Speichern/Laden, UI/UX verfeinert.
5. **M5 (nach Phase 5):** Testabdeckung 80–90 %, Beta-Test abgeschlossen, Release (Web → Desktop).

### Kritischer Pfad

```
Phase 1 (Datenmodell) → Phase 2 (Kernfunktionen) → Phase 3 (Karte) → Phase 4 (Multiplayer) → Phase 5 (Release)
```

Die **Tabellen-Überführung** in Phase 1 (maschinenlesbares Format) ist der kritischste Schritt — alle weiteren Phasen hängen davon ab.

### Voraussetzungen & Einmal-Aufgaben

- [ ] **Rechtliche Klärung:** Kontakt zu **Sharkbomb Games** (Inhaber von ExNovo) aufnehmen — Lizenzierung/Abstimmung erforderlich (siehe Phase 5)
- [ ] Steam Network-Zugang für Online-Multiplayer prüfen (siehe Phase 4)
- [ ] GitHub Actions-Workflow konfigurieren (siehe Phase 5)
- [ ] Hosting für Web-Release auf GitHub vorbereiten (siehe Phase 5)

## Begrenzungen

- **Alle bisherigen Entscheidungen aus Phasen 1–5 beachten** (übergreifende Zusammenfassung):
  - Vollständige Abbildung des Regelwerks — alle Tabellen, Aktionen und Regeln
  - Freies Zeichnen und Formen auf der Karte (beide Nutzergruppen)
  - Lokale Speicherung und vollständiger Export (PDF, JSON, SVG, PNG)
  - Optionale Aktionen mit Hinweis, ohne Zwang
  - Deutsch und Englisch (UI, Dokumentation)
  - Wachstumspool, Token-Zähler, Token-Validierung, Token-Übersicht
  - Fraktionen und Zeitleiste als Karteikarten, globale Historie, horizontale Zeitleiste
  - Undo-Funktion nach Phase
  - Online-Multiplayer: Server/Client, user-gehostet (lokal), 1–4 Spieler + Observer, Lobby, Server überträgt Updates
  - Hot-Seat offline, Spielerwechsel automatisch nach Zug
  - Speichern: automatisch + manuell, mehrere Speicherplätze, Liste, Standardname "NeueStadt" + Datum
  - Fokus-Modus, anpassbare Farben/Kontraste (AppTheme), Tastatur-Shortcuts
  - Datenhaltung lokal (keine Cloud)

### Plattformen

| Plattform | Status | Release-Reihenfolge |
|---|---|---|
| **Web** | Primäre Plattform | **1.** (GitHub Hosting) |
| **Desktop** (Windows, macOS, Linux) | Zielplattform | **2.** |
| **Mobile** (Android, iOS) | Zielplattform | Danach (App-Stores) |

### Tests

- Fokus: Desktop und Web (vorerst)
- Abdeckung: 80–90 %
- CI/CD: GitHub Actions

## Probleme

### Übergreifende Risiken

- **Regelwerk-Vollständigkeit:** Fehler im Datenmodell ziehen sich durch alle Phasen. Das Datenmodell muss in Phase 1 gründlich validiert werden.
- **Online-Multiplayer-Komplexität:** Server/Client mit Echtzeit-Synchronisation ist das riskanteste Feature. Empfehlung: Zuerst Hot-Seat vollständig abschließen, dann Online-Multiplayer.
- **Rechtliche Unsicherheit:** Ohne Klärung mit Sharkbomb Games kann das Projekt nicht veröffentlicht werden. Die Klärung sollte **so früh wie möglich** erfolgen (vor Phase 5), nicht erst am Ende.
- **Plattform-Vielfalt:** Mobile-Plattformen (Android, iOS) haben zusätzliche Anforderungen (App-Store-Richtlinien, Signierung). Diese erst nach dem Web/Desktop-Release angehen.
- **Datenmigration:** Spielstände müssen bei Updates migrierbar bleiben — Versions-Schema von Anfang an definieren (SemVer, `major.minor.patch+build`).

### Ressourcen-Einschätzung

| Ressource | Einschätzung |
|---|---|
| **Entwicklungszeit** | Einzelentwickler: 20–24 Wochen (5–6 Monate) |
| **Beta-Tester** | 4 (offene Beta, ~4 Wochen) |
| **Rechtliche Klärung** | Kontakt zu Sharkbomb Games, ggf. Lizenz |

## Offene Fragen

- Wie wird die Barrierefreiheit getestet (z. B. mit Screenreader)? *(aus Phase 4)*
- Wer genau ist der Ansprechpartner bei Sharkbomb Games, und wie läuft die Lizenzierung ab? *(aus Phase 5)*
- Sollen die Phasen streng sequenziell oder teilweise parallel bearbeitet werden (z. B. UI/UX-Verfeinerung aus Phase 4 parallel zu Phase 3)?
- Soll die geschätzte Dauer (20–24 Wochen) als realistisch angesehen oder angepasst werden?