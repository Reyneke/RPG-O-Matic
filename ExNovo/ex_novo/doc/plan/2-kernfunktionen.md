# Phase 2: Kernfunktionen

## Aufgaben

- [ ] Würfelmechanik implementieren (D6, 2D6, D66, D666) mit Ergebnisauswertung
- [ ] Tabellen-Browser mit Such- und Filterfunktion
- [ ] Spielzustandsverwaltung (Phasen, aktiver Spieler, Zeitleiste)
- [ ] Token-Verwaltung (Bürger-, Macht-Token, Wachstumspool)

## Begrenzungen

- **Alle bisherigen Entscheidungen beachten und ggf. anpassen** (siehe Phase 1):
  - Vollständige Abbildung des Regelwerks
  - Freies Zeichnen und Formen auf der Karte
  - Lokale Speicherung und vollständiger Export
  - Optionale Aktionen mit Hinweis, ohne Zwang
  - Deutsch und Englisch
  - Wachstumspool als separates Panel
  - Tutorial/Onboarding später
  - Datenhaltung lokal (keine Cloud)

### Technische Anforderungen

- **Würfelmechanik:** Zufallsgenerator muss deterministisch testbar sein und alle Würfeltypen (D6, 2D6, D66, D666) korrekt abbilden
- **Mehrsprachigkeit:** Alle UI-Texte und Tabelleninhalte müssen von Anfang an internationalisierbar sein (i18n)
- **Barrierefreiheit:** Reduzierte visuelle Ablenkung, klare Sprache, konsistente Navigation (siehe Phase 1)

## Probleme

### Technische Risiken

- **Korrektheit der Würfelergebnisse:** Die unterschiedlichen Würfeltypen müssen exakt den Regeln entsprechen. D66 und D666 sind Sequenzwürfe (jeder Würfel ist eine Ziffer), 2D6 ist eine Addition. Ein Fehler hier verfälscht alle Tabellenergebnisse.
- **Tabellendatenmenge:** Das vollständige Regelwerk enthält viele Tabellen (Ereignisse, Gelände, Ressourcen, Fraktionen, Wahrzeichen u. a.) mit optionalen Aktionen. Die Datenstruktur muss diese Komplexität abbilden, ohne unwartbar zu werden.
- **Spielzustands-Konsistenz:** Der Spielzustand (Phasen, aktiver Spieler, Zeitleiste, Token-Positionen) muss konsistent bleiben. Invarianten (z. B. maximale Bezirksdichte von 3, Token-Typen können nicht ausgetauscht werden) müssen durchgesetzt werden.
- **Token-Validierung:** Bürger-Token können nur in den Wachstumspool oder auf Bezirke, Macht-Token in den Pool, auf Features oder Fraktionen. Falsche Platzierungen müssen verhindert werden.

### Design-Herausforderungen

- **Balance zwischen Automatisierung und Freiheit:** Die Würfel- und Tabellenauswertung kann automatisiert werden, aber die Interpretation der Ereignisse bleibt den Spielern überlassen. Die UI muss beides unterstützen.
- **Optionale Aktionen:** Diese müssen klar als optional erkennbar sein (mit Hinweis), ohne den Spielfluss zu unterbrechen.
- **Wachstumspool als separates Panel:** Muss jederzeit zugänglich und übersichtlich sein, ohne die Karte zu verdecken.
- **Mehrsprachigkeit:** Tabellennamen und Beschreibungen müssen übersetzbar bleiben, ohne die Datenstruktur zu verkomplizieren.

## Entscheidungen

| Frage | Entscheidung |
|---|---|
| Sollen Würfelwürfe animiert dargestellt werden? | **Simple Animation.** |
| Soll es eine Funktion zum erneuten Würfeln geben? | **Ja.** (z. B. bei versehentlichem Wurf) |
| Sollen Würfelergebnisse im Spielverlauf protokolliert werden? | **Ja.** (für die Historie) |
| Wie sollen die Tabellen navigiert werden? | **Beides** — nach Phase und nach Typ. |
| Sollen Regelerklärungen angezeigt werden? | **Auf Wunsch** — z. B. per Popup. |
| Soll die Suche Volltext sein oder nach Kategorien filtern? | **Volltext.** |
| Wie wird der aktive Spieler angezeigt und gewechselt? | **Als oberstes Element in einer Liste.** |
| Soll der Spielzustand automatisch gespeichert werden? | **Ja** — nach jedem Zug. |
| Wie werden Phasenübergänge ausgelöst? | **Togglebar** — Standard: manuell durch die Spieler. |
| Soll es eine Undo-Funktion geben? | **Ja** — nach Phase. |
| Wie werden Token auf der Karte dargestellt? | **Als Zähler.** |
| Sollen Token-Bewegungen automatisch validiert werden? | **Ja.** (z. B. Bürger-Token nur auf Bezirke) |
| Soll es eine Übersicht aller Token-Positionen geben? | **Ja.** (z. B. als Liste) |
| Wie wird der Wachstumspool im Panel dargestellt? | **Als Zähler.** |
| Soll die App mehrere gleichzeitige Spiele unterstützen? | **Ja.** (z. B. verschiedene Städte) |
| Soll es eine automatische Spielhistorie/Chronik geben? | **Ja** — da die fertigen Städte exportiert werden sollen. |
| Wie werden Fraktionen und Zeitleiste dargestellt? | **Als Karteikarten.** |
