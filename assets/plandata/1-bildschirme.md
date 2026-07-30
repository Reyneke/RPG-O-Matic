# Bildschirme – Aktueller Stand

## Übersicht

Derzeit existiert **ein einziger Screen** (`HomeScreen` in `lib/screens/home_screen.dart`), der über eine `NavigationBar` (Bottom Navigation) vier Ansichten als private Widgets innerhalb derselben Datei bereitstellt. Es gibt keine separate Screen-Datei pro Ansicht – alle vier „Bildschirme" sind als private `StatelessWidget`-Klassen in `home_screen.dart` definiert.

---

## 1. Systemübersicht (`_SystemOverview`)

| Aspekt | Status |
|---|---|
| **Datei** | `lib/screens/home_screen.dart`, Zeilen 79–122 |
| **Typ** | Privates `StatelessWidget` |
| **Zustand** | 🟡 **Placeholder** – nur UI-Gerüst |
| **Implementiert** | ❌ Nein – Button-`onPressed` ist leer (`// TODO`) |
| **Anbindung** | Keine – kein State-Management, keine Datenhaltung |

### Anforderungen (KISS-Prinzip)

Dieser Bildschirm ist optisch nach dem **KISS-Prinzip** aufgebaut und soll folgende UI-Elemente enthalten:

| # | Element | Beschreibung |
|---|---------|-------------|
| 1 | **Drop-Zone** | Eine Fläche zum Ziehen von Regelwerken (Drag & Drop). Diese Fläche kann auch angeklickt werden, um einen `FilePicker` zu öffnen und Dateien auszuwählen. |
| 2 | **Liste: Noch zu verarbeitende Regelwerke** | Auflistung aller hochgeladenen, aber noch nicht verarbeiteten Dateien. |
| 3 | **Liste: Fertig inkludierte Regelwerke** | Auflistung aller erfolgreich verarbeiteten und ins System integrierten Dateien. |
| 4 | **Liste: Vorhandene Systeme** | Auflistung aller bereits vollständig angelegten RPG-Systeme. |
| 5 | **Button: Verarbeitung starten** | Ein Button, um die Verarbeitung der hochgeladenen Dateien zu starten. |
| 6 | **Neues System anlegen** | Möglichkeit, ein neues System anzulegen (dabei wird ein neuer Unterordner erstellt). |
| 7 | **System löschen** | Möglichkeit, Systeme nach einem **„Bist du dir sicher?"**-Dialog zu löschen. (Checkboxen neben den verarbeiteten Dateien?) |

### Nächste Schritte

- Drag-&-Drop-Funktionalität implementieren
- Datei-Parsing (PDF etc.) für Regelwerke
- Systembezogenen Projektordner anlegen und verwalten
- `FilePicker`-Integration
- Löschdialog mit Bestätigung

### Lücken & Verbesserungspotenzial

#### 1. Barrierefreiheit (Accessibility)

| Aspekt | Fehlt | Verbesserungsvorschlag |
|--------|-------|----------------------|
| **Screenreader-Unterstützung** | ❌ Keine `Semantics`-Labels | Jedes UI-Element (Drop-Zone, Listen, Buttons) benötigt `Semantics()`-Wrapper mit aussagekräftigen Labels – besonders wichtig für blinde und sehbehinderte Nutzer. | => Einrichten
| **Tastatur-Navigation** | ❌ Nicht bedacht | Drop-Zone muss auch per `Tab` + `Enter` fokussierbar und auslösbar sein. Listen müssen per Tastatur durchläufig sein. | => Einrichten
| **Farbkontraste** | ⚠️ Nicht spezifiziert | Die Drop-Zone und Status-Indikatoren („noch zu verarbeiten" vs. „fertig") sollten nicht nur farblich, sondern auch durch Symbole/Text unterschieden werden (Farbsehschwäche). | => Einrichten
| **Fokus-Indikatoren** | ❌ Nicht definiert | Klare, sichtbare Fokus-Ringe für alle interaktiven Elemente. | => Einrichten
| **Bewegungsreduzierung** | ❌ Nicht bedacht | Drag-&-Drop-Animationen sollten bei reduzierter Bewegung (`prefers-reduced-motion`) deaktiviert oder abgeschwächt werden. | => Einrichten
| **Fehlermeldungen** | ❌ Nicht spezifiziert | Bei fehlgeschlagenem Upload/Import: deutliche, mehrkanalige Rückmeldung (Text + Symbol + ggf. Sound/Vibration). | => Einrichten

#### 2. User Experience (UX)

| Aspekt | Fehlt | Verbesserungsvorschlag |
|--------|-------|----------------------|
| **Upload-Fortschritt** | ❌ Nicht spezifiziert | Fortschrittsanzeige (z. B. `LinearProgressIndicator`) während des Datei-Uploads und der Verarbeitung. Besonders wichtig für Neurodivergente: **klare Rückmeldung, dass etwas passiert**. | => Einrichten
| **Drag-Over-Visualisierung** | ❌ Nicht spezifiziert | Die Drop-Zone sollte optisch reagieren, wenn eine Datei darüber gezogen wird (z. B. farbliche Hervorhebung, gestrichelte → durchgezogene Linie). | => Einrichten
| **Dateityp-Prüfung** | ❌ Nicht spezifiziert | Sofortige Rückmeldung, wenn eine Datei mit nicht unterstütztem Format gezogen wird (z. B. `.exe`, `.zip`). | => Einrichten
| **Batch-Import** | ❌ Nicht spezifiziert | Können mehrere Dateien auf einmal gezogen werden? Falls ja: wie werden sie in der Liste dargestellt? | => Einrichten
| **System-Status** | ❌ Nicht spezifiziert | Jedes System sollte einen eindeutigen Status haben: `wird importiert`, `bereit`, `fehlerhaft`, `in Bearbeitung`. | => Einrichten
| **Leere Zustände** | ❌ Nicht spezifiziert | Was wird angezeigt, wenn **keine** Systeme vorhanden sind? Einladender Empty-State mit Erklärung und Handlungsaufforderung. | => Einrichten
| **Such- / Filterfunktion** | ❌ Nicht spezifiziert | Bei vielen Systemen: Suche oder Filter, um schnell ein bestimmtes System zu finden. | => Einrichten
| **Letzte Nutzung** | ❌ Nicht spezifiziert | Anzeige, wann ein System zuletzt verwendet wurde – hilfreich bei vielen Systemen. | => Einrichten

#### 3. Technische Aspekte

| Aspekt | Fehlt | Verbesserungsvorschlag |
|--------|-------|----------------------|
| **State-Management** | ❌ Nicht spezifiziert | Die Systemübersicht benötigt einen eigenen Provider/Notifier (z. B. `SystemProvider`), der den Zustand aller Systeme, Uploads und Verarbeitungsprozesse verwaltet. | => Einrichten
| **Datenpersistenz** | ❌ Nicht spezifiziert | Systeme und deren Status müssen dauerhaft gespeichert werden (z. B. lokale Datenbank mit `sqflite` oder `hive`, oder Dateisystem-basiert). | => Einrichten
| **PDF-Parsing** | ❌ Nicht spezifiziert | Wie genau werden PDFs geparst? Reicht Text-Extraktion oder braucht es Struktur-Erkennung (Tabellen, Überschriften)? | => Beides, Parsing und Struktur Erkennung.
| **Fehlerbehandlung** | ❌ Nicht spezifiziert | Was passiert bei: defekten PDFs, fehlenden Berechtigungen, vollem Speicher, abgebrochenem Import? | => Korrigieren, wenn möglich, evtl. über Addons, ansonsten Hinweis und Nichtübernahme.
| **Verarbeitungs-Pipeline** | ❌ Nicht spezifiziert | Klare Architektur für die Verarbeitungskette: Datei empfangen → validieren → parsen → Systemstruktur ableiten → speichern. | => Einrichten
| **Unterstützte Dateiformate** | ❌ Nicht spezifiziert | Nur PDF? Auch Word (.docx), Markdown (.md), JSON, XML? Eine klare Liste der unterstützten Formate fehlt. | => PDF, Markdown, JSON, XML, am besten so viele Textformate (Word, RTF, ODT ...) wie möglich.
| **System-Vorlagen** | ❌ Nicht spezifiziert | Braucht es ein JSON-Schema oder eine Vorlage, nach der Systeme aufgebaut sein müssen? Oder wird alles automatisch aus PDFs extrahiert? | => Da manche der Vorlagen sketchy sind, wäre ein Schema oder eine Vorlage praktisch, aber oft genug wird sich eine Etraktion nicht vermeiden lassen.

#### 4. Neurodivergenz & kognitive Barrierefreiheit

| Aspekt | Fehlt | Verbesserungsvorschlag |
|--------|-------|----------------------|
| **Klare Anweisungen** | ❌ Nicht spezifiziert | Jeder Bereich sollte eine kurze, prägnante Überschrift oder Anleitung haben (z. B. „Ziehe hier Regelwerke hinein"). | => Einrichten
| **Visuelle Hierarchie** | ❌ Nicht spezifiziert | Die drei Listen („noch zu verarbeiten", „fertig inkludiert", „vorhandene Systeme") müssen visuell klar getrennt sein – z. B. durch Karten (`Card`), farbige Akzente oder Abstände. | => Einrichten
| **Bestätigungsdialog** | ⚠️ Nur erwähnt | Der Löschdialog muss klar formulieren, **was** gelöscht wird und **ob es rückgängig gemacht werden kann** (möglichst ja – z. B. in einen Papierkorb verschieben statt endgültig löschen). | => Einrichten
| **Überforderung vermeiden** | ❌ Nicht spezifiziert | Nicht alle Informationen auf einmal zeigen. Einklappbare Bereiche (`ExpansionTile`) für die Listen, damit Nutzer selbst steuern können, was sie sehen. | => Einrichten
| **Konstante Terminologie** | ❌ Nicht spezifiziert | Einheitliche Begriffe verwenden: „Regelwerk" vs. „System" vs. „Datei" – was ist der Unterschied? Ein Glossar oder konsistente Benennung hilft. | => Einrichten

#### 5. UI/Design-Details

| Aspekt | Fehlt | Verbesserungsvorschlag |
|--------|-------|----------------------|
| **Empty-State** | ❌ Nicht spezifiziert | Wenn noch keine Systeme vorhanden sind: einladende Illustration/Icon + kurzer Text + direkter CTA („Erstes System hinzufügen"). | => Einrichten
| **Loading-/Skeleton-States** | ❌ Nicht spezifiziert | Während des Ladens der Systemliste: Skeleton-Widgets statt Spinner, um die spätere Struktur vorabzuzeigen. | => Einrichten
| **Undo-Funktion** | ❌ Nicht spezifiziert | Nach dem Löschen eines Systems: kurzzeitige „Rückgängig"-Option (Snackbar mit Action-Button). | => Einrichten
| **System-Icons** | ❌ Nicht spezifiziert | Jedes System könnte ein eigenes Icon oder eine Farbe haben (automatisch generiert oder vom Nutzer wählbar) – hilft bei der visuellen Unterscheidung. | => Einrichten
| **Drag-&-Drop aus OS** | ❌ Nicht spezifiziert | Flutter unterstützt `DragTarget` – aber auch das Hereinziehen von Dateien aus dem Betriebssystem? Das braucht `desktop_drop` oder ähnliche Pakete. | => Einrichten

### Fazit
Nochmals durchgehen, ob alle Unklarheiten für Schritt 1 beseitigt sind oder noch Punkte offen sind. Wenn nicht, ist Schritt 1 umzusetzen.

---

## 2. Charakter Generator (`_CharacterGenerator`)

| Aspekt | Status |
|---|---|
| **Datei** | `lib/screens/home_screen.dart`, Zeilen 124–167 |
| **Typ** | Privates `StatelessWidget` |
| **Zustand** | 🟡 **Placeholder** – nur UI-Gerüst |
| **Funktionalität** | Zeigt Icon, Titel, Beschreibungstext und einen „Charakter erstellen"-Button |
| **Implementiert** | ❌ Nein – Button-`onPressed` ist leer (`// TODO`) |
| **Anbindung** | Keine |
| **Nächste Schritte** | Systemauswahl, Charakterbogen-UI, Attributverwaltung, VTT-Export (Roll20, PDF) |

Anforderungen
Wie 

---

## 3. Cheatsheets (`_CheatsheetsView`)

| Aspekt | Status |
|---|---|
| **Datei** | `lib/screens/home_screen.dart`, Zeilen 169–212 |
| **Typ** | Privates `StatelessWidget` |
| **Zustand** | 🟡 **Placeholder** – nur UI-Gerüst |
| **Funktionalität** | Zeigt Icon, Titel, Beschreibungstext und einen „Cheatsheets generieren"-Button |
| **Implementiert** | ❌ Nein – Button-`onPressed` ist leer (`// TODO`) |
| **Anbindung** | Keine |
| **Nächste Schritte** | Cheatsheet-Generierung aus Systemdaten, PDF-Export |

---

## 4. NSC Generator (`_NpcGenerator`)

| Aspekt | Status |
|---|---|
| **Datei** | `lib/screens/home_screen.dart`, Zeilen 214–257 |
| **Typ** | Privates `StatelessWidget` |
| **Zustand** | 🟡 **Placeholder** – nur UI-Gerüst |
| **Funktionalität** | Zeigt Icon, Titel, Beschreibungstext und einen „NSC erstellen"-Button |
| **Implementiert** | ❌ Nein – Button-`onPressed` ist leer (`// TODO`) |
| **Anbindung** | Keine |
| **Nächste Schritte** | NSC-Generierungslogik, Systemdaten-Anbindung, Export |

---

## Navigation (`HomeScreen`)

| Aspekt | Status |
|---|---|
| **Navigationstyp** | `NavigationBar` (Bottom Navigation, Material 3) |
| **Einträge** | 4: Systeme, Charakter, Cheatsheets, NSCs |
| **State** | `_selectedIndex` (int) im `State` des `HomeScreen` |
| **Theme-Switcher** | ✅ Implementiert – `IconButton` in der `AppBar` schaltet via `ThemeProvider` zwischen Hell/Dunkel |
| **Barrierefreiheit** | ⚠️ Grundlegend – `tooltip` am Theme-Button, aber keine weiteren Maßnahmen (Semantik, Kontraste, Screenreader) |

---

## Theme / Styling

| Aspekt | Status |
|---|---|
| **Light Theme** | ✅ Definiert in `lib/theme/app_theme.dart` |
| **Dark Theme** | ✅ Definiert in `lib/theme/app_theme.dart` |
| **ThemeProvider** | ✅ Implementiert in `lib/providers/theme_provider.dart` (ChangeNotifier) |
| **Theme-Switcher** | ✅ Funktionsfähig in der AppBar |
| **Assets/Theme-Ordner** | ✅ Vorhanden unter `assets/theme/` (wird laut Idee ins Projekt kopiert) |

---

## Zusammenfassung

| Bildschirm | Status | Priorität (laut Idee) |
|---|---|---|
| Systemübersicht | 🟡 Placeholder | Höchste – Basis für alles Weitere |
| Charakter Generator | 🟡 Placeholder | Hoch |
| Cheatsheets | 🟡 Placeholder | Mittel |
| NSC Generator | 🟡 Placeholder | Mittel |
| Theme-Switcher | ✅ Fertig | – |
| Navigation | ✅ Grundstruktur fertig | – |

**Fazit:** Die App hat eine solide Grundstruktur (Navigation, Theme-Switcher, Material 3), aber **alle vier Hauptfunktionen sind reine Platzhalter ohne implementierte Logik**. Der nächste logische Schritt ist die Auslagerung der vier Ansichten in eigene Dateien (`lib/screens/system_overview.dart`, `character_generator.dart`, etc.) und die schrittweise Implementierung der Funktionen, beginnend mit dem System-Import (Drag & Drop, PDF-Parsing).
