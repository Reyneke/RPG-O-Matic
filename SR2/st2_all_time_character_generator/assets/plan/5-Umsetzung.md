Bezugnehmend auf "1-Anforderungsanalyse.md", "1-1-Regelinteraktionen.md", "2-Architektur.md", "3-Datenmodelle.md" und "4-UXUI-Design.md"

# Umsetzung - Implementierungsplan und Sprintplanung

## 0. Rahmenbedingungen

### 0.1 Edition-Spezifikation: **Ausschließlich Shadowrun 2. Edition**

Dieses Projekt implementiert **ausschließlich die Shadowrun 2. Edition** (SR2). Es erfolgt **keine** Vermischung mit anderen Editionen:

| Edition | Status | Begründung |
|---------|--------|------------|
| **Shadowrun 2. Edition (SR2)** | ✅ **Primär** | Alle Regeln, Daten und Mechaniken basieren auf SR2 |
| Shadowrun 1. Edition | ❌ Nicht enthalten | Eigenständiges Regelsystem, keine Kompatibilität |
| Shadowrun 3. Edition | ❌ Nicht enthalten | Deutlich andere Mechaniken (z.B. Zielzahlen-System) |
| Shadowrun 4. Edition | ❌ Nicht enthalten | Wechsel zu "X Erfolge"-System |
| Shadowrun 5. Edition | ❌ Nicht enthalten | Weiterentwicklung von SR4, inkompatibel |
| Shadowrun 6. Edition | ❌ Nicht enthalten | Neueste Edition, komplett andere Basis |
| Shadowrun Anarchy | ❌ Nicht enthalten | Stark vereinfachtes Regelwerk |

**Konsequenzen für die Implementierung**:
1. ✅ **Regel-Engine**: Implementiert ausschließlich SR2-Mechaniken (6er-Explosionen, Zielzahlen, Priority-System)
2. ✅ **Datenbasis**: Alle Werte (Attribute, Fertigkeiten, Ausrüstung) aus SR2-Quellen
3. ✅ **Quellenhierarchie**: Deutsches SR2-Grundregelwerk > Englische SR2-Quellen > SR2-Erweiterungen
4. ✅ **Validierung**: Prüft gegen SR2-Regeln, nicht gegen andere Editionen
5. ❌ **Keine** SR3-Kompatibilitätsmodi, SR4-Erfolgssysteme oder SR5-Extras
6. ❌ **Keine** automatische Konvertierung zwischen Editionen

**Referenz**: Siehe `1-1-Regelinteraktionen.md` §1 "Grundprinzip" für die detaillierte Edition-Spezifikation.

---

## 1. Arbeitsplan (Gantt-Übersicht)

### 1.1 Projektphasen Übersicht

```
Woche 1-2:   ████████████████████  Grundgerüst & Setup
Woche 3-4:   ████████████████████  Core Rules Implementation
Woche 5-6:   ████████████████████  Character Creation UI
Woche 7-8:   ████████████████████  Erweiterte Systeme
Woche 9-10:  ████████████████████  Magie & Spezial
Woche 11-12: ████████████████████  Erweiterte Features
Woche 13-14: ████████████████████  Polish & Testing
```

### 1.2 Detaillierte Arbeitspakete

#### **Phase 1: Grundgerüst (Woche 1-2)**
**Ziel**: Funktionsfähiges Projekt-Setup mit Datenbank und Basis-Architektur

| AP | Arbeitspaket | Aufwand | Abhängigkeiten |
|----|--------------|---------|----------------|
| 1.1 | Flutter-Projekt initialisieren | 4h | - |
| 1.2 | Dependencies konfigurieren (pubspec.yaml) | 2h | 1.1 |
| 1.3 | Drift Datenbank-Schema implementieren | 8h | 1.2 |
| 1.4 | Repository-Interfaces definieren | 4h | 1.2 |
| 1.5 | Riverpod Provider-Setup | 4h | 1.2 |
| 1.6 | Theme-System integrieren (bestehendes app_theme.dart) | 4h | 1.2 |
| 1.7 | ThemeSwitcher implementieren | 6h | 1.6 |
| 1.8 | Basis-Ordnerstruktur erstellen | 2h | 1.1 |
| 1.9 | Unit-Test-Setup | 4h | 1.1 |
| 1.10 | CI/CD Pipeline (GitHub Actions) | 4h | 1.1 |

**Meilenstein M1**: Projekt kompilierbar, Datenbank erstellt, Theme funktionsfähig

---

#### **Phase 2: Core Rules (Woche 3-4)**
**Ziel**: Regel-Engine mit Probenmechanik, Attributen, Priority-System

| AP | Arbeitspaket | Aufwand | Abhängigkeiten |
|----|--------------|---------|----------------|
| 2.1 | Rule-Engine Grundgerüst | 8h | 1.3, 1.4 |
| 2.2 | Probenmechanik (Würfelsystem) | 12h | 2.1 |
| 2.3 | 6er-Explosionen & Grenzfälle | 6h | 2.2 |
| 2.4 | Edge-System Integration | 8h | 2.2 |
| 2.5 | Attributsystem mit Limits | 10h | 2.1 |
| 2.6 | Metatype-Boni berechnen | 6h | 2.5 |
| 2.7 | Priority-System Logik | 10h | 2.5 |
| 2.8 | Fertigkeitssystem Basis | 8h | 2.1 |
| 2.9 | Regel-Validierung Framework | 8h | 2.1 |
| 2.10 | Erste Unit-Tests für Regeln | 8h | 2.2-2.9 |

**Meilenstein M2**: Probenmechanik funktioniert, Attribute berechenbar, Priority-System validierbar

---

#### **Phase 3: Character Creation UI (Woche 5-6)**
**Ziel**: UI für Charakter-Erstellung mit Wizard-Flow

| AP | Arbeitspaket | Aufwand | Abhängigkeiten |
|----|--------------|---------|----------------|
| 3.1 | Home Screen implementieren | 6h | 1.7 |
| 3.2 | Character List Screen | 6h | 1.4, 1.5 |
| 3.3 | Character Creation Wizard (5 Schritte) | 20h | 2.5, 2.7, 4.1 |
| 3.4 | Metatype Selection UI | 6h | 3.3 |
| 3.5 | Attribute Allocation UI (Sliders) | 10h | 3.3 |
| 3.6 | Skill Selection UI | 10h | 3.3 |
| 3.7 | Magic/Resonance Selection UI | 8h | 3.3 |
| 3.8 | Equipment Selection UI (Basis) | 8h | 3.3 |
| 3.9 | Echtzeit-Validierung in UI | 8h | 2.9 |
| 3.10 | Character Detail Screen | 10h | 3.2 |

**Meilenstein M3**: Kompletter Character Creation Flow funktionsfähig

---

#### **Phase 4: Erweiterte Systeme (Woche 7-8)**
**Ziel**: Edge, Initiative, Schaden, Vor-/Nachteile

| AP | Arbeitspaket | Aufwand | Abhängigkeiten |
|----|--------------|---------|----------------|
| 4.1 | Edge-System UI Integration | 6h | 2.4 |
| 4.2 | Initiative-Berechnung | 8h | 2.2 |
| 4.3 | Schadenssystem implementieren | 10h | 2.2 |
| 4.4 | Vor- und Nachteile-System | 12h | 2.9 |
| 4.5 | Voraussetzungs-Prüfung | 8h | 4.4 |
| 4.6 | Karma-Berechnung | 6h | 4.4 |
| 4.7 | Combat Preview (Initiative-Phasen) | 8h | 4.2 |
| 4.8 | Validation Error Screen | 6h | 3.9 |

**Meilenstein M4**: Alle Core Rules in UI integriert, Validierung funktioniert

---

#### **Phase 5: Magie & Spezial (Woche 9-10)**
**Ziel**: Magie-System, Essence, Fokus, Initiation

| AP | Arbeitspaket | Aufwand | Abhängigkeiten |
|----|--------------|---------|----------------|
| 5.1 | Magie-System (Magier) | 12h | 4.1 |
| 5.2 | Adept-System | 10h | 5.1 |
| 5.3 | Technomancer-System | 10h | 5.1 |
| 5.4 | Essence-Berechnung & Cyberware | 8h | 4.1 |
| 5.5 | Zauber-Datenbank | 8h | 5.1 |
| 5.6 | Geister-Beschwörung | 8h | 5.1 |
| 5.7 | Fokus-System | 6h | 5.1 |
| 5.8 | Initiation-Regeln | 8h | 5.1 |
| 5.9 | Magie-UI (Spell Selection, etc.) | 10h | 5.1-5.8 |

**Meilenstein M5**: Magie/Resonance vollständig implementiert

---

#### **Phase 6: Erweiterte Features (Woche 11-12)**
**Ziel**: PDF-Import, Updates, Export, Plugin-System

| AP | Arbeitspaket | Aufwand | Abhängigkeiten |
|----|--------------|---------|----------------|
| 6.1 | PDF-Parser (Grundregeln) | 16h | 2.1 |
| 6.2 | Regelwerk-Import UI | 8h | 6.1 |
| 6.3 | Update-Mechanismus (Checksum) | 8h | 6.1 |
| 6.4 | Migrations-System | 8h | 6.3 |
| 6.5 | JSON Export/Import | 6h | 3.10 |
| 6.6 | PDF Export (Charakterbogen) | 10h | 3.10 |
| 6.7 | Foundry VTT Export | 8h | 6.5 |
| 6.8 | Plugin-System Grundgerüst | 10h | 2.1 |
| 6.9 | Hausregeln-Konfiguration UI | 8h | 6.8 |

**Meilenstein M6**: Import/Export funktioniert, Plugin-System bereit

---

#### **Phase 7: Polish & Testing (Woche 13-14)**
**Ziel**: Performance, Bugfixes, Dokumentation

| AP | Arbeitspaket | Aufwand | Abhängigkeiten |
|----|--------------|---------|----------------|
| 7.1 | Integrationstests | 12h | Alle |
| 7.2 | Performance-Optimierung | 8h | 7.1 |
| 7.3 | Caching-Strategien implementieren | 6h | 7.2 |
| 7.4 | Isolates für Validierung | 6h | 7.2 |
| 7.5 | Bugfixes (aus Testing) | 10h | 7.1 |
| 7.6 | UI/UX Polish | 8h | 7.5 |
| 7.7 | Accessibility-Audit | 6h | 7.6 |
| 7.8 | Responsive Testing (Mobile/Tablet/Desktop) | 6h | 7.6 |
| 7.9 | Dokumentation schreiben | 8h | 7.5 |
| 7.10 | User-Manual erstellen | 6h | 7.9 |

**Meilenstein M7**: Release-fähige Version

---

### 1.3 Kritischer Pfad

```
1.1 → 1.2 → 1.3 → 2.1 → 2.2 → 2.5 → 2.7 → 3.3 → 3.10 → 6.1 → 6.5 → 7.1 → 7.9
```

**Engpässe**:
1. **Datenbank-Schema** (1.3): Blockiert alle weiteren Schritte
2. **Rule-Engine** (2.1): Kern des gesamten Systems
3. **Character Creation UI** (3.3): Komplexester UI-Teil
4. **PDF-Parser** (6.1): Technisch anspruchsvoll, aber MVP-relevant für Regel-Referenzen

---

## 2. Entscheidungen (Getroffene Entscheidungen aus offenen Fragen)

### 2.1 Technische Entscheidungen

| # | Frage | Entscheidung | Status |
|---|-------|-------------|--------|
| T1 | Soll PDF-Parsing MVP-Feature sein oder post-MVP? | **MVP** - Wird für Referenzen benötigt (strikte Einhaltung der 2. Edition Regeln) | ✅ Entschieden |
| T2 | Welche PDF-Bibliothek ist am besten? | **pdf_text für MVP**, dann Migration zu pdfium post-MVP | ✅ Entschieden |
| T3 | Sollen wir Build-Runner für freezed/drift im CI laufen lassen? | **Ja** - Build-Runner im CI ausführen | ✅ Entschieden |
| T4 | Wie handhaben wir Multi-Threading bei Validierung? | **Isolates** (statt Compute) | ✅ Entschieden |
| T5 | Soll das Plugin-System MVP-Fähig sein oder erst in v2? | **v2** - Plugin-System kommt nach MVP | ✅ Entschieden |

### 2.2 Inhaltliche Entscheidungen (Shadowrun-Regeln)

| # | Frage | Entscheidung | Status |
|---|-------|-------------|--------|
| R1 | Welche Quellenbücher priorisieren? | **Regelbände (GRW) vor Abenteuerbänden, Deutsche PDFs vor Englischen** (siehe 1-Anforderungsanalyse §6.2) | ✅ Entschieden |
| R2 | Sollen Hausregeln standardmäßig aktiviert oder deaktiviert sein? | **Deaktiviert**, aber per Optionsmenü freischaltbar | ✅ Entschieden |
| R3 | Wie implementieren wir Essence-Magic-Interaktion? | **Nach deutschem GRW und Schattenläufer Kompendium** | ✅ Entschieden |
| R4 | Sollen alle optionalen Regeln als Plugin angeboten werden? | **Ja** - Optionale Regeln als Plugins | ✅ Entschieden |
| R5 | Wie gehen wir mit Regel-Ausnahmen um? | **Einfügen, aber Rückfrage halten** | ✅ Entschieden |

### 2.3 UX/Design Entscheidungen

| # | Frage | Entscheidung | Status |
|---|-------|-------------|--------|
| U1 | Character Creation Wizard linear oder mit Skip-Optionen? | **Mit Skip-Optionen** - Design orientiert sich an Chummer 5a | ✅ Entschieden |
| U2 | Wie tief sollen Erklärungen/Tooltips gehen? | **So tief, dass Neurodivergente und Anfänger schnellen Einstieg haben** | ✅ Entschieden |
| U3 | Tutorial/Onboarding für neue Nutzer? | **Ja** - Onboarding wird implementiert | ✅ Entschieden |
| U4 | Export-Formate priorisieren? | **PDF > Roll20 > JSON > Foundry > XML > Rest** | ✅ Entschieden |

### 2.4 Plattform & Deployment Entscheidungen

| # | Frage | Entscheidung | Status |
|---|-------|-------------|--------|
| P1 | Web, Desktop und Mobile gleichzeitig releasen? | **Zuerst Desktop, dann Web, dann Mobile** | ✅ Entschieden |
| P2 | Wo hosten wir Regelwerk-Updates? | **GitHub Releases** (Regelwerk ist in der App) | ✅ Entschieden |
| P3 | Cloud-Sync-Funktion? | **Ja, aber erst in einer späteren Version** (Post-MVP) | ✅ Entschieden |

---

## 3. Sprintplanung

### 3.1 Sprint 0: Projekt-Setup (Woche 1-2) ✅ ABGESCHLOSSEN

> **Status**: ✅ Abgeschlossen
> - Projekt kompilierbar (flutter analyze: no issues)
> - Datenbank (Drift) mit 7 Tabellen erstellt
> - Repository-Interfaces definiert
> - Riverpod 3.x Provider-Setup
> - Theme-System (app_theme.dart) erweitert
> - ThemeSwitcher implementiert
> - CI/CD Pipeline (GitHub Actions)
> - Unit-Tests (3 Tests, all green)

### 3.2 Sprint 1: Core Rules Engine (Woche 3-4) ✅ ABGESCHLOSSEN

> **Status**: ✅ Abgeschlossen
> - **DiceRoller**: Würfelsystem mit 6er-Explosionen, Edge-Aktionen, Grenzfälle
> - **Metatypes**: Alle 5 SR2-Metatypen (Mensch-Elf-Zwerg-Ork-Troll) mit Boni & Limits
> - **Priority System**: Attributspunkte (30-10), Skillpunkte (40-15), Nuyen (1M-5K)
> - **RuleEngine**: Attributs-Validierung gegen Metatype-Limits, Priority-Validierung
> - **Validation Framework**: ValidationResult, ValidationMessage, CharacterValidator
> - **Unit-Tests**: 46 Tests, all green; `flutter analyze`: no issues
>
> **Erkanntes Problem**: Immer wieder schleichen sich Relikte aus anderen Shadowrun-
> Versionen in den Code ein (z.B. Edge-System). Daher folgt Sprint 1.5 zur direkten
> PDF-basierten Regelverifikation.

### 3.3 Sprint 1.5: PDF-basierte Regelverifikation (Zusatz-Sprint) 🏃 AKTUELL

**Sprint Goal**: Alle implementierten Core Rules gegen die originalen SR2-PDFs verifizieren
und Fehlinterpretationen aus anderen Editionen bereinigen.

**Begründung**:
> Da es immer wieder passiert, dass Relikte aus anderen Shadowrunversionen
> auftauchen (z.B. Edge), werden die Regelwerke unter `/assets/pdf/de` und
> `/assets/pdf/en` direkt eingelesen und mit der Implementierung abgeglichen.

**Primäre Quellen**:
| PDF | Sprache | Priorität |
|-----|---------|-----------|
| `assets/pdf/SR2/de/Grundregelwerk SR2.01D.pdf` | 🇩🇪 Deutsch | ⭐ Höchste |
| `assets/pdf/SR2/en/Core Rulebook Second Edition (FAS7901).pdf` | 🇬🇧 Englisch | Referenz |
| `assets/pdf/SR2/de/Shadowrun Kompendium - Jenseits der Schatten.pdf` | 🇩🇪 Deutsch | Erweiterung |

**Zu verifizierende Regeln**:
- [ ] **Probenmechanik** (6er-Explosionen vs. andere Editionen)
- [ ] **Attributs-Limits** je Metatyp (korrekte Max/Min laut GRW S. 15-20)
- [ ] **Priority-System** (Punkte-Werte A-E laut GRW S. 24-30)
- [ ] **Metatype-Boni** (keine Boni aus SR3/SR4 übernommen)
- [ ] **Edge-System** (Existiert Edge in SR2 überhaupt? Korrekte Regel?)
- [ ] **Essence-Berechnung** (GRW vs. Schattenläufer Kompendium)
- [ ] **Initiative-Berechnung** (Quickness + Intelligence korrekt?)
- [ ] **Schadenssystem** (Light/Physical/Serious laut GRW)

**Tasks**:
```
1. PDF-Parser aufsetzen (pdf_text) für Text-Extraktion
2. Deutsches GRW (Grundregelwerk SR2.01D.pdf) einlesen
3. Relevante Kapitel identifizieren: Attribute (Kap. 2), Priority (Kap. 3), Proben (Kap. 4)
4. Attributs-Limits und Metatype-Boni aus PDF extrahieren und mit Code abgleichen
5. Priority-System-Punkte aus PDF extrahieren und mit Code abgleichen
6. Edge-Regel im PDF suchen: Gibt es Edge in SR2? Wenn ja: korrekte Regel implementieren
7. Essence-Berechnung aus PDF extrahieren
8. Initiative-/Schadensregeln aus PDF extrahieren
9. Alle Abweichungen dokumentieren und Code korrigieren
10. Unit-Tests mit PDF-Referenzwerten aktualisieren
```

**Definition of Done**:
- ✅ Alle implementierten Core Rules sind mit PDF-Quellen abgeglichen
- ✅ Alle Abweichungen dokumentiert und korrigiert
- ✅ Edge-System nach SR2-Regeln (nicht nach anderen Editionen)
- ✅ Unit-Tests referenzieren PDF-Seitenzahlen
- ✅ `flutter analyze`: no issues

**Risiken**:
- PDF-Parsing (pdf_text) könnte ungenau sein → Manuelle Überprüfung der Extraktion
- GRW-PDF könnte gescannt sein (OCR nötig) → Option A: pdfium (Post-MVP). Option B: **google_mlkit_text_recognition** (verfügbar, Desktop/Mobile). Option C: Manueller Abgleich als Fallback.
- OCR-Strategie: `google_mlkit_text_recognition` kann direkt in Sprint 1.5 genutzt werden, falls `pdf_text` nicht ausreicht. Keine externe Websuche nötig.

---

### 3.4 Sprint 2: Character Creation UI (Woche 5-6)

**Sprint Goal**: Kompletter Character Creation Wizard funktionsfähig

**User Stories**:
- [ ] US-009: Als Nutzer möchte ich einen Wizard geführt werden, um einen Charakter zu erstellen
- [ ] US-010: Als Nutzer möchte ich meinen Metatypen wählen und dessen Boni sehen
- [ ] US-011: Als Nutzer möchte ich Attribute per Slider verteilen
- [ ] US-012: Als Nutzer möchte ich Fertigkeiten auswählen und spezialisieren
- [ ] US-013: Als Nutzer möchte ich Magie/Resonanz wählen (falls verfügbar)
- [ ] US-014: Als Nutzer möchte ich sofort sehen, wenn ich einen Fehler mache

**Design-Entscheidungen (siehe §2.3)**:
- Wizard mit **Skip-Optionen** (nicht linear) - orientiert an Chummer 5a
- Tiefgehende **Tooltips und Erklärungen** für Neurodivergente und Anfänger
- **Onboarding/Tutorial** für neue Nutzer

**Tasks**:
```
[ ] Home Screen implementieren (Action Cards)
[ ] Character List Screen (Riverpod State Management)
[ ] Character Creation Screen mit Stepper (mit Skip-Optionen)
[ ] Metatype Selection Widget (Cards mit Boni)
[ ] Attribute Allocation Widget (Sliders + Punkte-Verteilung)
[ ] Skill Selection Widget (Gruppen, Spezialisierungen)
[ ] Magic/Resonance Selection Widget
[ ] Equipment Selection Widget (Basis)
[ ] ValidationMessage Widget (Error/Warning Display)
[ ] Echtzeit-Validierung in allen Widgets
[ ] Character Detail Screen (Expandable Sections)
[ ] Character Save/Delete Funktionalität
[ ] Tooltip-System für tiefgehende Erklärungen
[ ] Onboarding/Tutorial Screen
[ ] Integrationstests für Character Creation Flow
```

**Definition of Done**:
- ✅ Kompletter Wizard durchläuft alle 5 Schritte (mit Skip-Optionen)
- ✅ Tooltips und Erklärungen für alle relevanten Felder
- ✅ Onboarding/Tutorial für neue Nutzer
- ✅ Validierung zeigt Fehler in Echtzeit
- ✅ Charakter kann gespeichert und geladen werden
- ✅ UI ist responsive (Desktop-first, dann Web, dann Mobile)
- ✅ Accessibility: Screen Reader getestet

**Risiken**:
- UI-Komplexität → Timeboxing pro Widget (max 10h)
- State Management Komplexität → Riverpod Patterns befolgen

---

### 3.5 Sprint 3: Advanced Systems (Woche 7-8)

**Sprint Goal**: Erweiterte Regelsysteme integriert

**User Stories**:
- [ ] US-015: Als Nutzer möchte ich Edge im Kampf einsetzen können
- [ ] US-016: Als Nutzer möchte ich Initiative würfeln und Phasen sehen
- [ ] US-017: Als Nutzer möchte ich Schaden berechnen (körperlich, schwer, Licht)
- [ ] US-018: Als Nutzer möchte ich Vor- und Nachteile mit Voraussetzungen wählen

**Tasks**:
```
[ ] Edge-System UI (Edge-Pool Anzeige, Edge-Aktionen Buttons)
[ ] Initiative-Berechnung (Wurf + Modifikatoren)
[ ] Initiative-Phasen Visualisierung
[ ] Schadenssystem (Stufen: Light, Physical, Serious)
[ ] Rüstungs-Berechnung
[ ] Vor- und Nachteile-Datenbank
[ ] Quality Selection Widget
[ ] Voraussetzungs-Prüfung (PrerequisiteChecker)
[ ] Karma-Berechnung (Qualities, Skills, Attributes)
[ ] Validation: Essence-Magic-Interaktion
[ ] Validation: Cyberware-Essence-Kosten
[ ] Combat Preview Screen (Initiative-Phasen)
[ ] Error Screen mit Lösungsvorschlägen
```

**Definition of Done**:
- ✅ Edge kann in Proben eingesetzt werden
- ✅ Initiative wird korrekt berechnet
- ✅ Schaden wird korrekt berechnet und angezeigt
- ✅ Vor-/Nachteile prüfen Voraussetzungen
- ✅ Essence-Magic-Interaktion wird validiert

**Risiken**:
- Kampfsystem-Komplexität → MVP: Nur Basis-Kampf, erweiterte Regeln später
- Voraussetzungs-Prüfung kann komplex werden → Dependency Graph nutzen

---

### 3.6 Sprint 4: Magic & Resonance (Woche 9-10)

**Sprint Goal**: Vollständiges Magie/Resonance-System

**User Stories**:
- [ ] US-019: Als Magier möchte ich Zauber lernen und einsetzen
- [ ] US-020: Als Magier möchte ich Geister beschwören
- [ ] US-021: Als Magier möchte ich Fokus bonden
- [ ] US-022: Als Magier möchte ich Initiation durchführen
- [ ] US-023: Als Adept möchte ich Adeptenkräfte kaufen
- [ ] US-024: Als Technomancer möchte ich Complex Forms nutzen
- [ ] US-025: Als Nutzer möchte ich sehen, wie Cyberware mein Magie beeinflusst

**Tasks**:
```
[ ] MagicPath Entity erstellen
[ ] Spell Entity + Datenbank
[ ] Spirit Entity + Beschwörungs-Logik
[ ] Focus Entity + Bonding-Logik
[ ] Initiation-Logik (Grade, Kosten, Voraussetzungen)
[ ] AdeptPower Entity + Logik
[ ] Technomancer-System (Resonance, Complex Forms, Sprites)
[ ] Essence-Berechnung (Cyberware, Bioware)
[ ] Essence-Magic-Loss berechnen
[ ] Magic Selection UI
[ ] Spell Selection UI
[ ] Spirit Management UI
[ ] Focus Management UI
[ ] Initiation UI
[ ] Magic Validation (Essence, Voraussetzungen)
```

**Definition of Done**:
- ✅ Magier kann Zauber wirken
- ✅ Geister können beschworen werden
- ✅ Fokus können gebondet werden
- ✅ Initiation funktioniert
- ✅ Adeptenkräfte funktionieren
- ✅ Technomancer-System funktioniert
- ✅ Essence-Magic-Interaktion wird korrekt berechnet

**Risiken**:
- Magie-System ist sehr komplex → Fokus auf Kern-Regeln, erweiterte später
- Balance zwischen Magier/Adept/Technomancer → Playtesting erforderlich

---

### 3.7 Sprint 5: Advanced Features (Woche 11-12)

**Sprint Goal**: Import/Export, Updates, Plugin-System

**User Stories**:
- [ ] US-026: Als Nutzer möchte ich Regelwerke aus PDFs importieren
- [ ] US-027: Als Nutzer möchte ich automatische Updates für Regelwerke erhalten
- [ ] US-028: Als Nutzer möchte ich meinen Charakter als PDF exportieren
- [ ] US-029: Als Nutzer möchte ich meinen Charakter für Foundry VTT exportieren
- [ ] US-030: Als Nutzer möchte ich Hausregeln aktivieren/deaktivieren

**Tasks**:
```
[ ] PDF-Parser implementieren (Tabellen-Extraktion)
[ ] Rulebook-Import UI
[ ] Rule-Extraktion aus PDF (Regex + Heuristiken)
[ ] Checksum-Berechnung für PDFs
[ ] Update-Checker (Online + Offline)
[ ] Migration-Runner (Schema-Updates)
[ ] JSON Export/Import
[ ] PDF Export (Character Sheet)
[ ] Foundry VTT JSON-Format
[ ] Roll20 Export (optional)
[ ] Plugin-System Grundgerüst
[ ] RulePlugin Interface
[ ] Plugin-Manager
[ ] Hausregeln-Konfiguration UI
[ ] Plugin-Loader (Dynamisches Laden)
```

**Definition of Done**:
- ✅ PDFs können importiert werden (Grundregeln getestet)
- ✅ Updates werden erkannt und installiert
- ✅ PDF-Export funktioniert
- ✅ Foundry VTT Export funktioniert
- ✅ Plugin-System kann Hausregeln laden

**Risiken**:
- PDF-Parsing ist ungenau → Fallback zu manuellem Import
- Plugin-System könnte Over-Engineering sein → MVP: Nur einfache Erweiterungen

---

### 3.8 Sprint 6: Polish & Release (Woche 13-14)

**Sprint Goal**: Release-fähige Version

**User Stories**:
- [ ] US-031: Als Nutzer möchte ich eine schnelle, responsive App haben
- [ ] US-032: Als Nutzer möchte ich verstehen, wie die App funktioniert (Dokumentation)
- [ ] US-033: Als Entwickler möchte ich wissen, dass der Code funktioniert (Tests)

**Tasks**:
```
[ ] Integrationstests schreiben (End-to-End)
[ ] Performance-Optimierung (Caching, Lazy Loading)
[ ] Isolates für Validierung implementieren
[ ] Caching-Strategie für Würfelpools
[ ] Lazy Loading für Equipment-Datenbank
[ ] Bugfixes (aus Testing)
[ ] UI/UX Polish (Animationen, Übergänge)
[ ] Accessibility-Audit (TalkBack, VoiceOver)
[ ] Responsive Testing (3 Plattformen)
[ ] Benutzer-Dokumentation schreiben
[ ] Entwickler-Dokumentation (README)
[ ] Changelog erstellen
[ ] Release vorbereiten (Version 1.0.0)
[ ] GitHub Release erstellen
[ ] App Stores vorbereiten (optional)
```

**Definition of Done**:
- ✅ Alle Tests grün (>80% Coverage)
- ✅ Performance: Charakter-Erstellung < 2s
- ✅ Accessibility: WCAG 2.1 AA konform
- ✅ Responsive: Funktioniert auf Mobile, Tablet, Desktop
- ✅ Dokumentation vollständig
- ✅ Release auf GitHub

**Risiken**:
- Zeit für Bugfixes unterschätzt → Buffer 20% einplanen
- Plattform-spezifische Bugs → Early Testing auf allen Plattformen

---

## 4. Team & Rollen

### 4.1 Empfohlenes Team

| Rolle | Verantwortlich | Fokus |
|-------|----------------|-------|
| **Projektleiter** | 1 Person | Koordination, Entscheidungen, Stakeholder-Kommunikation |
| **Flutter-Entwickler** | 1-2 Personen | UI, State Management, Platform-Code |
| **Backend-Entwickler** | 1 Person | Datenbank, Regel-Engine, PDF-Parser |
| **Regel-Experte** | 1 Person (extern) | Shadowrun-Regeln, Validierung, Korrektheit |
| **UX/UI-Designer** | 1 Person (kann Dev sein) | Screens, Components, Accessibility |
| **QA/Testing** | 1 Person (kann Dev sein) | Tests, Bug-Reports, Qualitätssicherung |

### 4.2 Empfohlene Arbeitsweise

**Agile Methodik**:
- 2-Wochen Sprints
- Daily Standups (15min)
- Sprint Planning (Montag, 1h)
- Sprint Review (Freitag, 30min)
- Sprint Retrospective (Freitag, 30min)

**Tools**:
- **Projektmanagement**: GitHub Projects oder Jira
- **Kommunikation**: Discord/Slack
- **Code-Review**: GitHub Pull Requests
- **CI/CD**: GitHub Actions
- **Dokumentation**: Markdown in Git

---

## 5. Qualitätssicherung

### 5.1 Testing-Strategie

```
┌─────────────────────────────────────────┐
│  Test-Pyramide                         │
├─────────────────────────────────────────┤
│         ╱                               │
│        ╱  Integration Tests (10%)       │
│       ╱                                 │
│      ╱  Widget Tests (20%)              │
│     ╱                                   │
│    ╱  Unit Tests (70%)                  │
│   ╱                                     │
│  ╱                                      │
└─────────────────────────────────────────┘
```

**Unit Tests** (70%):
- Regel-Engine (Würfeln, Berechnungen)
- Validierung (Attribute, Priority, Qualities)
- Repository (Datenbank-Operationen)
- Utils (Helfer-Funktionen)

**Widget Tests** (20%):
- Character Creation Widgets
- ValidationMessage Widget
- ThemeSwitcher
- Character List Screen

**Integration Tests** (10%):
- Complete Character Creation Flow
- Save/Load Character
- PDF Import → Character
- Export → PDF/JSON

### 5.2 Code-Qualität

**Standards**:
- **Linting**: `flutter analyze` mit strict rules
- **Formatting**: `dart format` (automatisch in CI)
- **Type Safety**: Keine `dynamic`, keine `!` (null-checks)
- **Documentation**: Alle public Methoden dokumentiert (dartdoc)
- **Code Review**: Mindestens 1 Reviewer pro PR

**Metriken**:
- Test Coverage > 80%
- Keine Lint-Warnings
- Alle Tests grün
- Build-Zeit < 5min

---

## 6. Risikomanagement

### 6.1 Technische Risiken

| Risiko | Wahrscheinlichkeit | Impact | Mitigation | Owner |
|--------|-------------------|--------|------------|-------|
| **PDF-Parsing ungenau** | Hoch | Hoch | Fallback zu manuellem Import, OCR | Dev |
| **Regel-Interpretationsfehler** | Hoch | Hoch | Experten-Review, Chummer5E-Vergleich | Regelleite |
| **Performance-Probleme** | Mittel | Mittel | Caching, Isolates, Profiling | Dev |
| **Datenbank-Migration fehlerhaft** | Mittel | Hoch | Umfassende Tests, Rollback-Strategie | Dev |
| **Cross-Platform-Bugs** | Mittel | Mittel | Früh testen auf allen Plattformen | Dev |

### 6.2 Projekt-Risiken

| Risiko | Wahrscheinlichkeit | Impact | Mitigation | Owner |
|--------|-------------------|--------|------------|-------|
| **Scope Creep** | Hoch | Hoch | Klare MVP-Definition, Change-Request-Prozess | PM |
| **Zeitüberschreitung** | Mittel | Hoch | Timeboxing, Buffer einplanen, Priorisierung | PM |
| **Team-Verfügbarkeit** | Mittel | Mittel | Dokumentation, Knowledge-Sharing | PM |
| **Regel-Komplexität** | Hoch | Mittel | MVP: Nur Core Rules, iterativ erweitern | Team |

### 6.3 Mitigation-Strategien

**Für PDF-Parsing**:
- Woche 1: Proof-of-Concept mit 1 PDF
- Fallback: Manueller Import als Option
- OCR für gescannte PDFs (tesseract)

**Für Regel-Komplexität**:
- MVP: Nur Grundregeln (Kapitel 1-3 aus Grundregelwerk)
- Erweiterte Regeln als Plugins
- Regelleite frühzeitig einbinden

**Für Performance**:
- Profiling ab Sprint 2
- Caching ab Sprint 3
- Isolates ab Sprint 6

---

## 7. Meilensteine & Deliverables

### 7.1 Meilenstein-Übersicht

| Meilenstein | Datum (Woche) | Deliverable | Kriterium |
|-------------|---------------|-------------|-----------|
| **M1** | Woche 2 | Projekt-Setup | Kompilierbar, Datenbank erstellt, Theme funktioniert |
| **M2** | Woche 4 | Core Rules Engine | Probenmechanik, Attribute, Priority-System funktionsfähig |
| **M3** | Woche 6 | Character Creation UI | Kompletter Wizard, Validierung, Save/Load |
| **M4** | Woche 8 | Advanced Systems | Edge, Initiative, Schaden, Qualities |
| **M5** | Woche 10 | Magic System | Magier, Adept, Technomancer vollständig |
| **M6** | Woche 12 | Advanced Features | PDF-Import, Export, Plugin-System |
| **M7** | Woche 14 | Release Candidate | Tests grün, Dokumentation fertig, Release bereit |

### 7.2 Was ist ein MVP Feature?

**MVP = Minimum Viable Product** (Minimal lebensfähiges Produkt)

Ein MVP Feature ist die **kleinste mögliche Version** eines Features, die:
1. **Funktionsfähig** ist (keine Placeholder)
2. **Einen echten Nutzen** bietet (löst ein echtes Problem)
3. **Ohne Abhängigkeiten** funktioniert (keine "wird später implementiert" TODOs)
4. **Testbar** ist (man kann es verifizieren)

**MVP-Prinzipien**:
- ❌ Nicht: "Wir bauen erstmal die halbe Sache"
- ✅ Sondern: "Wir bauen die kleinste funktionsfähige Version"

**Beispiel für ein MVP Feature**:
```
❌ Schlecht (kein MVP):
   - "PDF-Import" → Nur 50% implementiert, braucht noch OCR, 
     braucht noch Update-Mechanismus, funktioniert nur mit 
     deutschen PDFs...

✅ Gut (MVP):
   - "PDF-Import für deutsche Grundregeln" → Funktioniert 
     komplett für 1 spezifisches PDF, hat Fallback zu 
     manuellem Import, ist getestet
```

**MVP-Entscheidungskriterien**:

| Kriterium | Frage | MVP? |
|-----------|-------|------|
| **Funktional** | Löst es ein echtes Nutzerproblem? | ✅ Ja |
| **Vollständig** | Ist es komplett implementiert (keine TODOs)? | ✅ Ja |
| **Unabhängig** | Funktioniert es ohne andere Features? | ✅ Ja |
| **Testbar** | Kann man es verifizieren? | ✅ Ja |
| **Wartbar** | Ist der Code von guter Qualität? | ✅ Ja |

---

### 7.3 MVP-Definition (Minimum Viable Product)

**MVP umfasst** (Features, die die Kriterien erfüllen):

#### ✅ **Must-Have MVP Features**:

**1. Grundregeln (Core Rules)**
- ✅ Probenmechanik (Würfelsystem mit 6er-Explosionen)
- ✅ Attributsystem (Berechnung, Limits, Metatype-Boni)
- ✅ Priority-System (Ressourcen-Verteilung)
- ✅ Fertigkeitssystem (Aktiv/Passiv, Spezialisierungen)
- ✅ Edge-System (Basis-Implementation)
- ✅ Initiative-Berechnung
- ✅ Schadenssystem (Basis: Light, Physical, Serious)

**2. Charaktererschaffung**
- ✅ Wizard-Flow (5 Schritte: Metatyp → Attribute → Skills → Magie → Ausrüstung)
- ✅ Echtzeit-Validierung (Fehler sofort sichtbar)
- ✅ Speichern/Laden (SQLite)
- ✅ Metatypen (Mensch, Elf, Zwerg, Ork, Troll)

**3. Basis-Ausrüstung**
- ✅ Waffen (aus Grundregelwerk)
- ✅ Rüstung (aus Grundregelwerk)
- ✅ Cyberware (Basis: Essence-Berechnung)

**4. Vor-/Nachteile**
- ✅ Qualities-System (Positiv/Negativ)
- ✅ Karma-Berechnung
- ✅ Voraussetzungs-Prüfung (Basis)

**5. Magie/Resonance (Basis)**
- ✅ Magier (Zauber, Geister beschwören)
- ✅ Adept (Adeptenkräfte)
- ✅ Essence-Magic-Interaktion

**6. PDF-Import & Referenzen**
- ✅ PDF-Parser für Grundregelwerk (pdf_text)
- ✅ Regel-Extraktion aus PDF (Regex + Heuristiken)
- ✅ Fallback zu manuellem Import

**7. Export**
- ✅ PDF-Export (Charakterbogen)
- ✅ Roll20-Export
- ✅ JSON-Export (für Backup/Transfer)

**8. UI/UX**
- ✅ Responsive Design (Desktop-first, dann Web, dann Mobile)
- ✅ Theme-System (Light/Dark/High-Contrast)
- ✅ Barrierefreiheit (WCAG 2.1 AA)
- ✅ Tooltips und tiefgehende Erklärungen
- ✅ Onboarding/Tutorial für neue Nutzer
- ✅ Wizard mit Skip-Optionen (orientiert an Chummer 5a)

---

#### ❌ **Post-MVP Features** (Nicht in MVP):

**1. Erweiterte Regeln**
- ❌ Matrix-Regeln (Deck, Programme, IC) → Komplex, eigenständiges System
- ❌ Fahrzeug-Kampf → Nischen-Feature, nur 5% der Spieler nutzen es
- ❌ Erweiterte Quellenbücher (Chromebook, etc.) → Nach Grundregeln
- ❌ Optionale Regeln (Karma-Varianten, etc.) → Erst nach Core Rules stabil

**2. Import/Export Erweiterungen**
- ❌ PDF-Import (automatisch) → Technisch anspruchsvoll, Fallback zu JSON
- ❌ Foundry VTT Integration → Spezifisches Format, post-MVP
- ❌ Roll20 Export → Selten genutzt
- ❌ Regelwerk-Updates (automatisch) → Erst nach manuellem Import

**3. Erweiterte Features**
- ❌ Plugin-System → Over-Engineering für MVP, einfache Erweiterungen reichen
- ❌ Cloud-Sync → Erhöht Komplexität, lokale DB reicht für MVP
- ❌ Charakter-Hintergrund-System → Nice-to-have, nicht kritisch
- ❌ Lifestyle-System → Erweitert, nicht essentiell

**4. Technische Features**
- ❌ Isolates für Validierung → Performance-Optimierung, erst bei Problemen
- ❌ Advanced Caching → Erst bei Performance-Issues
- ❌ OCR für gescannte PDFs → Fallback zu manuellem Import reicht

---

#### **MVP-Entscheidungsprozess**:

```
Neue Feature-Idee
    ↓
Löst es ein echtes Problem? (Nutzer-Bedarf)
    ↓
Ist es vollständig implementierbar? (Keine TODOs)
    ↓
Benötigt es andere Features? (Abhängigkeiten)
    ↓
Ist es testbar? (Qualität)
    ↓
Kann es in 2 Sprints (4 Wochen) fertiggestellt werden?
    ↓
Ja → MVP
Nein → Post-MVP
```

**Beispiel-Entscheidungen**:

| Feature | MVP? | Begründung |
|---------|------|------------|
| **Probenmechanik** | ✅ Ja | Kern des Spiels, vollständig implementierbar, keine Abhängigkeiten |
| **PDF-Import** | ❌ Nein | Technisch ungenau, Fallback nötig, kann später kommen |
| **Matrix-Regeln** | ❌ Nein | Komplex, nur 20% der Charaktere nutzen es, post-MVP |
| **ThemeSwitcher** | ✅ Ja | Einfach zu implementieren, Barrierefreiheit, sofortiger Nutzen |
| **Cloud-Sync** | ❌ Nein | Erhöht Komplexität, lokale DB reicht, Datenschutz-Bedenken |
| **Foundry VTT Export** | ❌ Nein | Spezifisches Format, nur 10% Nutzer brauchen es |

---

### 7.4 MVP-Erfolgskriterien

**Das MVP ist erfolgreich, wenn**:
1. ✅ Ein Nutzer kann einen kompletten Charakter erstellen (in < 30 Minuten)
2. ✅ Alle Grundregeln funktionieren (getestet gegen Referenz)
3. ✅ Der Charakter kann gespeichert und geladen werden
4. ✅ Der Charakter kann als PDF exportiert werden
5. ✅ Die App läuft auf mindestens einer Plattform (Web/Desktop/Mobile)
6. ✅ Es gibt keine kritischen Bugs (keine Crashes, keine falschen Berechnungen)

**Das MVP ist NICHT erfolgreich, wenn**:
- ❌ Manuelle Workarounds nötig sind (z.B. "Tippe die Werte von Hand ein")
- ❌ Regeln fehlen oder falsch berechnet werden
- ❌ Die App crasht bei normaler Nutzung
- ❌ Man braucht 2 Stunden für einen Charakter
- ❌ Es gibt keine Möglichkeit, den Charakter zu speichern

---

## 8. Nächste Schritte (Sofort)

### 8.1 Vor Sprint-Beginn

1. **Team zusammenstellen** (Woche 0)
   - [ ] Flutter-Entwickler finden
   - [ ] Regel-Experte kontaktieren
   - [ ] Kommunikations-Tools einrichten

2. **Projekt initialisieren** (Tag 1)
   - [ ] Flutter-Projekt erstellen
   - [ ] GitHub Repository einrichten
   - [ ] CI/CD Pipeline konfigurieren

3. **Regel-Review** (Woche 1)
   - [ ] Grundregelwerk durchgehen
   - [ ] Regel-Referenz-Tabelle erstellen
   - [ ] Edge Cases dokumentieren

### 8.2 Sprint 0 Vorbereitung

- [ ] Alle Dependencies in pubspec.yaml eintragen
- [ ] Ordnerstruktur erstellen
- [ ] Drift Schema entwerfen
- [ ] Theme-System testen

---

## 9. Anhang

### 9.1 Referenzen

- **Anforderungen**: `1-Anforderungsanalyse.md`
- **Regelinteraktionen**: `1-1-Regelinteraktionen.md`
- **Architektur**: `2-Architektur.md`
- **Datenmodelle**: `3-Datenmodelle.md`
- **UI/UX**: `4-UXUI-Design.md`
- **Theme**: `lib/theme/app_theme.dart`

### 9.2 Glossar

| Begriff | Definition |
|---------|------------|
| **AP** | Arbeitspaket |
| **MVP** | Minimum Viable Product |
| **SR2** | Shadowrun 2. Edition |
| **Drift** | SQLite ORM für Flutter/Dart |
| **Riverpod** | State Management für Flutter |
| **freezed** | Code-Generation für immutable Models |
| **Essence** | Maß für Menschlichkeit (0-6), beeinflusst Magie |
| **Edge** | Glücks-Punkte für außergewöhnliche Aktionen |
| **Priority** | Ressourcen-Verteilung bei Charaktererschaffung |

### 9.3 Changelog

| Version | Datum | Änderungen |
|---------|-------|------------|
| 1.0.0 | 2026-01-29 | Initiale Erstellung |