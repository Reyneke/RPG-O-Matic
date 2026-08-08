# Phase 4: Kollaboration & Verfeinerung

## Aufgaben

- [ ] Lokaler Mehrspielermodus (Hot-Seat)
- [ ] Online-Mehrspielermodus (optional, falls gewünscht)
- [ ] Fraktions- und Zeitleisten-Verwaltung mit Historie
- [ ] Speichern/Laden von Spielständen
- [ ] UI/UX-Verfeinerung und Barrierefreiheit

## Begrenzungen

- **Alle bisherigen Entscheidungen beachten und ggf. anpassen** (siehe Phasen 1–3):
  - Vollständige Abbildung des Regelwerks
  - Freies Zeichnen und Formen auf der Karte
  - Lokale Speicherung und vollständiger Export
  - Optionale Aktionen mit Hinweis, ohne Zwang
  - Deutsch und Englisch
  - Wachstumspool als separates Panel
  - Datenhaltung lokal (keine Cloud)
  - Token auf der Karte als Zähler
  - Token-Bewegungen automatisch validieren
  - Fraktionen und Zeitleiste als **Karteikarten**
  - Automatische Spielhistorie/Chronik (für Export)
  - Undo-Funktion nach Phase

### Online-Mehrspieler

- **Online ist erwünscht** — dies erweitert die bisherige Entscheidung "kein Online-Multiplayer in v1" aus Phase 1. Die Umsetzung als **Server/Client-Architektur** ist zu prüfen.
- **Hinweis:** Die bisherige Entscheidung in `0a-idee.md` (Nicht-Ziele) muss entsprechend angepasst werden.

### Technische Anforderungen

- **Hot-Seat:** Mehrere Spieler teilen sich ein Gerät — Spielerwechsel muss einfach und klar sein
- **Online:** Echtzeit-Synchronisation des Spielzustands (Karte, Token, Zeitleiste, Fraktionen) zwischen mehreren Clients
- **Speichern/Laden:** Spielstände müssen lokal gespeichert und geladen werden können (siehe Phase 1)
- **Barrierefreiheit:** UI/UX-Verfeinerung unter Berücksichtigung der Anforderungen aus Phase 1

## Probleme

### Technische Risiken

- **Server/Client-Komplexität:** Echtzeit-Synchronisation erfordert einen Server, Konfliktlösung und Netzwerk-Handling. Dies ist deutlich komplexer als der lokale Hot-Seat-Modus.
- **Karten-Synchronisation:** Zeichenaktionen auf der Karte müssen in Echtzeit an alle Clients übertragen werden. Latenz und Konflikte (zwei Spieler zeichnen gleichzeitig) müssen gelöst werden.
- **Spielzustands-Konsistenz:** Der Spielzustand muss auf allen Clients identisch sein. Invarianten (Token-Validierung, Phasenübergänge) müssen serverseitig durchgesetzt werden.
- **Offline-Verhalten:** Was passiert, wenn ein Client die Verbindung verliert? Muss der Spielzustand wiederhergestellt werden können?
- **Server-Betrieb:** Wer betreibt den Server? Lokal (Peer-to-Peer), selbst gehostet oder als Cloud-Dienst? Dies widerspricht ggf. der Entscheidung "keine Cloud".

### Design-Herausforderungen

- **Hot-Seat-Erlebnis:** Der Spielerwechsel muss flüssig sein — aktiver Spieler als oberstes Element in einer Liste (siehe Phase 2), klare Anzeige, wessen Zug es ist.
- **Online-Erlebnis:** Die Kollaboration soll auch online funktionieren — gemeinsames Zeichnen, Token-Bewegungen und Diskussionen müssen unterstützt werden.
- **Fraktions- und Zeitleisten-Verwaltung:** Als Karteikarten (siehe Phase 2) — mit Historie, die automatisch mitgeschrieben wird.
- **Undo nach Phase:** Die Undo-Funktion muss phasenweise funktionieren — auch bei mehreren Spielern und online.
- **Barrierefreiheit:** Die UI/UX-Verfeinerung muss die Anforderungen aus Phase 1 erfüllen (reduzierte Ablenkung, klare Sprache, konsistente Navigation).

## Entscheidungen

| Frage | Entscheidung |
|---|---|
| Soll der Online-Modus als Server/Client-Architektur umgesetzt werden? | **Ja.** Der Server wird von einem Nutzer gehostet (wie QUake 3). Verbindungen via IP oder Steam Network. |
| Soll der Server lokal (Peer-to-Peer) oder zentral (Cloud) betrieben werden? | **Lokal.** |
| Wie viele Spieler können online gleichzeitig spielen? | **1–4 aktive Spieler**, der Rest als Observer. |
| Soll es eine Raum-/Lobby-Verwaltung geben? | **Ja.** (z. B. mit Einladungscode) |
| Wie wird die Karten-Synchronisation gelöst? | **Server überträgt** — Clients empfangen die Updates. |
| Soll der Hot-Seat-Modus auch ohne Online-Funktion nutzbar sein? | **Ja.** (offline) |
| Wie wird der Spielerwechsel im Hot-Seat umgesetzt? | **Automatisch nach Zug.** |
| Wie werden Karteikarten dargestellt? | **Liste mit Karten-Layout.** |
| Soll die Historie pro Fraktion oder global geführt werden? | **Global.** |
| Wie wird die Zeitleiste visualisiert? | **Horizontal, mit Ereignisnamen.** |
| Soll es mehrere Speicherplätze geben? | **Ja.** (z. B. verschiedene Städte) |
| Soll das Speichern automatisch oder manuell erfolgen? | **Sowohl als auch.** |
| Wie werden Spielstände benannt und organisiert? | **Organisiert als Liste.** Benennung im Dialog. Standard: "NeueStadt" + Datum, vom Nutzer änderbar. |
| Soll es einen Fokus-Modus geben? | **Ja.** (reduzierte Ablenkung) |
| Wie werden Farben und Kontraste anpassbar gemacht? | **Per AppTheme Widget.** |
| Soll es Tastatur-Shortcuts geben? | **Ja.** |

## Verbleibende offene Fragen

- Wie wird die Barrierefreiheit getestet (z. B. mit Screenreader)?
