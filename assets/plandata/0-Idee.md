# RPG-O-Matic — Idee & Planung

**Kernidee:** Ein Charaktergenerator für mehrere RPG-Systeme.

---

## Programmablauf

### 1. Hinzufügen neuer Systeme

- Die Systeme werden vom Nutzer per Drag & Drop als Dateien (u. a. PDF) in die App gezogen.
- Die App speichert diese Daten in einem systembezogenen Projektordner und liest sie selbstständig ein.
- Wenn der Nutzer auf **„Erstellen“** klickt, erzeugt die App selbstständig einen Charaktergenerator.  
  **Offene Frage:** Soll dieser Generator *innerhalb* der App genutzt werden können, oder als eigenständige App ausgeliefert werden?

### 2. Charaktererschaffung

- Der Nutzer wählt ein System aus, für das er einen Charakter erstellen möchte.
- Die App stellt ihm alle dafür notwendigen Mittel zur Verfügung.
- Nach der Erstellung werden die Charakterdaten in für gängige VTTs (z. B. Roll20) sowie als PDF exportiert und im Projektordner gespeichert.

### 3. Cheatsheets

- Für alle erfassten Systeme sollen auf Wunsch **Cheatsheets** erstellt werden, die Neulingen den Einstieg erleichtern.
- Die Cheatsheets sollen als PDF exportierbar sein.

### 4. Regelkurzfassungen & Handouts

- Ebenfalls sollen **Regelkurzfassungen** und **Handouts** zu den Systemen erzeugt werden – aus demselben Grund wie die Cheatsheets.
- Auch diese Materialien sollen als PDF verfügbar sein.

### 5. NSC-Generator

- Es soll eine einfache Möglichkeit geschaffen werden, **Nichtspielercharaktere (NSCs)** für die vom Nutzer eingelesenen Systeme zu generieren.

---

## Rahmenbedingungen

- **Programmiersprache:** Flutter (plattformübergreifend)
- **Barrierefreiheit / Inklusion:**  
  Die App soll besonders für folgende Zielgruppen nutzbar sein:
  - Neurodivergente Personen
  - Personen mit körperlichen oder geistigen Einschränkungen (z. B. Farbsehschwäche)
- **Dokumentation:** Eine ausführliche Dokumentation wird unter `/doc` abgelegt.
- **Theme-Switcher:** Die App erhält einen Theme-Switcher. Dazu wird der Ordner `assets/theme` in das erzeugte Projekt kopiert.

---

## Offene Fragen

- Soll der Charaktergenerator in der App integriert oder als separate App ausgeliefert werden?
- Welche VTT-Exportformate werden initial unterstützt (neben Roll20)?
- Sollen Cheatsheets und Regelkurzfassungen automatisch oder nur auf expliziten Wunsch erzeugt werden?
- Welche Barrierefreiheitsstandards (z. B. WCAG) sollen als Mindestanforderung gelten?
- Wie viele Systeme werden initial unterstützt – reichen Dateiformat-Importe oder braucht es eine Systemvorlage?