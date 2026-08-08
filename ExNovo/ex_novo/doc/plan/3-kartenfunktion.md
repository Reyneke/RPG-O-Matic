# Phase 3: Kartenfunktion

## Aufgaben

- [ ] Digitale Kartenfläche mit Zeichenwerkzeugen (Regionen, Gelände, Wahrzeichen, Ressourcen, Bezirke)
- [ ] Benennung und Beschriftung von Features
- [ ] Token auf der Karte platzieren und verschieben
- [ ] Karten exportieren/importieren (z. B. als Bild oder JSON)

## Begrenzungen

- **Alle bisherigen Entscheidungen beachten und ggf. anpassen** (siehe Phasen 1 & 2):
  - Vollständige Abbildung des Regelwerks
  - **Freies Zeichnen und Formen** — beide Nutzergruppen werden angesprochen
  - Lokale Speicherung und vollständiger Export (mit Texten und allem)
  - Optionale Aktionen mit Hinweis, ohne Zwang
  - Deutsch und Englisch
  - Wachstumspool als separates Panel
  - Datenhaltung lokal (keine Cloud)
  - Token auf der Karte als **Zähler**
  - Token-Bewegungen automatisch validieren
  - Übersicht aller Token-Positionen

### Technische Anforderungen

- **Zeichenfläche:** Muss auf allen Zielplattformen funktionieren (Web, Desktop, Mobile) — Touch- und Maus-Interaktion
- **Performance:** Die Karte muss auch bei komplexen Zeichnungen flüssig bleiben (insbesondere auf mobilen Geräten)
- **Export/Import:** Vollständiger Export des Projekts inkl. Karte, Texten, Token-Positionen und Historie
- **Barrierefreiheit:** Reduzierte visuelle Ablenkung, klare Symbole, anpassbare Farben/Kontraste (siehe Phase 1)

## Probleme

### Technische Risiken

- **Zeichen-Performance:** Freies Zeichnen erzeugt viele Punkte. Ohne Optimierung (z. B. Vektorisierung, Ebenen, Lazy-Rendering) kann die Karte auf mobilen Geräten ruckeln.
- **Plattform-Unterschiede:** Touch-Gesten (Pinch-Zoom, Zeichnen mit Finger) vs. Maus/Stift (Präzision, Rechtsklick) erfordern unterschiedliche Interaktionsmodelle.
- **Datenmodell der Karte:** Die Karte muss alle Feature-Typen (Regionen, Gelände, Wahrzeichen, Ressourcen, Bezirke) mit ihren Eigenschaften (Name, Symbol, Token) abbilden. Ein fehlerhaftes Modell führt zu Datenverlust beim Export/Import.
- **Export-Format:** Das Exportformat muss alle Informationen verlustfrei enthalten (Karte, Texte, Token, Historie) und gleichzeitig für den Druck geeignet sein (z. B. als Bild).
- **Token-Validierung auf der Karte:** Bürger-Token nur auf Bezirke, Macht-Token auf Features/Fraktionen. Die Platzierung muss automatisch validiert werden (siehe Phase 2).

### Design-Herausforderungen

- **Balance zwischen freiem Zeichnen und Formen:** Beide Nutzergruppen müssen bedient werden — freies Zeichnen für Kreative, vorgefertigte Formen für Strukturierte.
- **Benennung und Beschriftung:** Features müssen benannt und beschriftet werden können. Die Beschriftung muss lesbar bleiben, auch wenn die Karte gezoomt wird.
- **Token-Darstellung als Zähler:** Zähler müssen auf der Karte sichtbar sein, ohne die Zeichnung zu verdecken.
- **Ebenen-Konzept:** Regionen-Linien sollten heller sein als andere Features (laut Regelwerk). Die Karte sollte Ebenen unterstützen, um dies umzusetzen.
- **Undo/Redo:** Versehentliche Zeichenaktionen müssen rückgängig gemacht werden können (nach Phase, siehe Phase 2).

## Entscheidungen

| Frage | Entscheidung |
|---|---|
| Welche vorgefertigten Formen sollen angeboten werden? | **Freihand, Linie, Kreis/Ellipse, Rechteck, Polygon** sowie **Symbol-Werkzeuge** (Bäume, Berge, Wellen, Häuser u. ä.) — abgestimmt auf die Feature-Typen des Regelwerks. |
| Sollen Farben pro Feature-Typ vorgegeben oder frei wählbar sein? | **Frei wählbar.** |
| Soll es eine Ebenen-Verwaltung geben? | **Ja.** (z. B. Regionen, Gelände, Features getrennt) |
| Wie wird das Löschen von Zeichnungen umgesetzt? | **Alle drei** — Radierer (feine Korrekturen), Auswahl (gezieltes Löschen von Features) und komplett (Ebene/Karte leeren). Es spricht nichts dagegen, da sie unterschiedliche Zwecke erfüllen. |
| Wie werden Namen eingegeben und angezeigt? | **Textfeld.** |
| Sollen Namen automatisch skaliert werden? | **Ja** — wenn die Karte gezoomt wird. |
| Soll es eine Namensliste aller Features geben? | **Ja.** (z. B. zum schnellen Auffinden) |
| Wie werden Token-Zähler auf der Karte dargestellt? | **Beides** — Zahl und Symbol. |
| Wie werden Token verschoben? | **Beides** — Drag & Drop und Menü. |
| Sollen Token-Positionen an Features gebunden sein? | **Ja** — an Features gebunden, nicht frei platzierbar. |
| Welche Exportformate werden unterstützt? | **PDF, JSON, SVG, PNG.** |
| Soll der Export die komplette Stadt enthalten? | **Ja** — inkl. Historie und Fraktionen. |
| Soll der Import fremde Projekte unterstützen? | **Ja.** |
| Wie wird die Karte beim Export skaliert? | **Vom Nutzer wählbar** — Standard: 1:1 im ungezoomten Modus (Originalgröße). |
| Soll die Karte mehrere Ansichten unterstützen? | **Ja.** (z. B. Vogelperspektive, Zoom auf Bezirke) |
| Soll es ein Raster/Gitternetz als Hilfslinie geben? | **Ja.** |
| Wie wird die Karte beim Start eines neuen Spiels initialisiert? | **Leer** — da die Wahl von Größe und dergleichen Teil einer Phase ist. |
