# Detaillierte Anforderungsanalyse - Shadowrun 2. Edition Charaktergenerator

## 1. Charakterbau (Systeme)

### 1.1 Attributsystem
- Primäre Attribute: Body, Quickness, Strength, Charisma, Intelligence, Willpower, Essence, Magic/Resonance
- Attributsberechnung basierend auf Metatyp
- Mindest- und Maximalwerte pro Attribut
- Attributskostenberechnung mit Priority-System

### 1.2 Fertigkeitssystem
- Aktive und passive Fertigkeiten
- Fertigkeitsgruppen und Spezialisierungen
- Skill-Improvement-Regeln
- Kostenberechnung für Fertigkeiten

### 1.3 Magie/Resonance-System
- **Magier**: Zauber, Geister, Foki, Initiation
- **Adepten**: Adeptenkräfte, Initiation
- **Technomancer**: Complex Forms, Sprites, Submersion
- Magie/Resonance-Attribute und Kosten

### 1.4 Vorteile/Nachteile-System
- Qualities-Katalog (positiv und negativ)
- Kostenberechnung und Limits
- Bedingungen und Voraussetzungen

## 2. Grundregeln

### 2.1 Probenmechanik
- Würfelsystem (6er-Explosionen)
- Zielzahlen und Schwierigkeitsgrade
- Grenzfälle (1en, 6en)
- Edge-System

### 2.2 Kampfsystem
- Initiative-Berechnung und Phasen
- Schadensarten (körperlich, schwer, Licht)
- Rüstung und Panzerung
- Waffen und Modifikatoren
- Nahkampf und Fernkampf

### 2.3 Matrix-Regeln
- Deck-Attribute und Programme
- IC-Typen und -Verhalten
- Cyberdeck-Modifikationen
- Matrix-Aktionen

### 2.4 Fahrzeugregeln
- Fahrzeugattribute und -typen
- Fahrzeugkampf-Regeln
- Modifikationen und Upgrades

## 3. Erweiterungsregeln

### 3.1 Quellenbücher-Integration
- Kompatibilität mit offiziellen Quellenbüchern
- Regelvarianten aus verschiedenen Editionen
- Priorisierung der zu implementierenden Bücher

### 3.2 Hausregeln
- Konfigurierbare Regeloptionen
- Benutzerdefinierte Regeln und Anpassungen
- Regelausnahmen dokumentieren

## 4. Optionale Regeln

### 4.1 Karma-Varianten
- Verschiedene Karma-Kostenmodelle
- Karma-Belohnungssysteme
- Konfigurierbare Karma-Regeln

### 4.2 Erweiterte Charakteroptionen
- Zusätzliche Metatypen und -varianten
- Spezielle Attribute und Fähigkeiten
- Alternative Charaktererschaffung

### 4.3 Kampfoptionen
- Ausführliche Regeln für verschiedene Kampfstile
- Spezialmanöver und -techniken
- Optionales Kampfregel-Set

## 5. Erstellungsregeln

### 5.1 Ausrüstung
- Waffenkatalog mit allen relevanten Daten
- Rüstungssystem und -varianten
- Cyberware/Bioware-Katalog
- Implantate und Modifikationen
- Ausrüstungskosten und Verfügbarkeit

### 5.2 Lifestyle
- Verschiedene Lebensstile (Straße, Mittelstand, Luxus)
- Kosten, Vorteile und Nachteile
- Kontakte und Verbindungen
- Lifestyle-bezogene Regeln

### 5.3 Finanzen
- Startkapitalberechnung
- Ressourcenverwaltung
- Einkommensquellen und -möglichkeiten
- Vermögensverwaltung

### 5.4 Hintergrund
- Charakterhintergrund-System
- Kontaktnetzwerk
- Lebensereignisse und -geschichte

## 6. Offene Fragen

### 6.1 Technische Fragen
- [x] **Datenbank-Design**: SQLite für lokale Speicherung
  - Lokale Datenbank mit Option für zukünftige Backend-Anbindung
- [x] **Implementierung komplexer Regelinteraktionen**: Siehe separate Analyse in `1-1-Regelinteraktionen.md`
  - Grundregeln als Ausgangspunkt
  - Übersicht aller Regeln als Abhängigkeitsdiagramm
  - Detaillierte Analyse der Regelabhängigkeiten (Priority-System, Magie/Resonance, Qualities)
- [x] **Performance-Optimierung**: Erforderlich bei umfangreichen Charakteren
  - Lazy Loading, Caching-Strategien, effiziente Datenstrukturen
- [x] **Export-Formate**: PDF, Roll20, JSON, XML, Foundry JSON
  - PDF für Charakterbögen, JSON für digitale Tools (Roll20, Foundry VTT)
- [ ] **Architektur-Entscheidungen**: State Management und Datenmodell noch zu definieren
  - Clean Architecture mit Separation of Concerns
  - Repository Pattern für Datenzugriff
  - State Management: Provider/Riverpod/Bloc (zu entscheiden)

### 6.2 Inhaltliche Fragen
- [x] **Quellenbücher-Priorisierung**:
  - **Primär**: Alle offiziellen Bücher aus `assets/pdf/SR2/de` und `assets/pdf/SR2/en`
  - Regelbücher vor Abenteuerbänden
  - Deutsche Ausgaben bevorzugt vor Englischen
  - Höchstprio: Deutsches Grundregelwerk
- [x] **Hausregeln**: Standardmäßig deaktiviert
  - Implementierung wie in Chummer: per Optionsmenü zuschaltbar
  - Konfigurierbare Regeloptionen
- [x] **Optionale Regeln**: Alle als Option anbieten
  - Modular implementiert, einzeln aktivierbar
- [x] **Ausrüstungsdatenbank**: Umfang basierend auf verfügbaren Quellen
  - Alle in den PDFs vorhandenen Ausrüstungsgegenstände
- [x] **Mehrsprachigkeit**: Deutsch und Englisch
  - UI und Regeltexte in beiden Sprachen
  - Internationalisierung (i18n) implementieren

### 6.3 Benutzerfreundlichkeit
- [x] **UI/UX-Konzept**: KISS-Prinzip (Keep It Simple, Stupid)
  - Barrierefreiheit für neurodivergente Personen
  - Klare, übersichtliche Strukturen
  - Vermeidung von Überlastung
  - Anpassbare Ansichten
- [x] **Hilfesystem**: Regelreferenzen integrieren
  - Kontext-sensitive Hilfe
  - Direkte Verlinkung zu Regeltexten
  - Tooltips und Erklärungen
- [x] **Validierung**: Umfassende Fehlerbehandlung bei Charaktererstellung
  - Echtzeit-Validierung
  - Klare Fehlermeldungen
  - Vorschläge zur Fehlerbehebung
- [x] **Berechnungsmodus**: Automatisch mit manueller Korrektur-Option
  - Automatische Berechnung als Standard
  - Manuelle Override-Möglichkeit für erfahrene Nutzer
  - Transparente Darstellung der Berechnungen

### 6.4 Plattform und Deployment
- [x] **Zielplattformen**: Web, Desktop, Mobile (alle drei)
  - Flutter für plattformübergreifende Entwicklung
  - Responsive Design für verschiedene Bildschirmgrößen
- [x] **Offline-Funktionalität**: Vollständig erforderlich
  - Lokale Datenbank (SQLite)
  - Keine Online-Zwänge für Grundfunktionen
- [x] **Speicherung**: Lokal mit Datenbank-Architektur
  - SQLite als primäre Speicherung
  - Datenbank-Design für zukünftige Erweiterbarkeit
  - Export/Import für Backup und Transfer
- [ ] **Update-Mechanismus für Regelwerke**: Detaillierte Konzeption erforderlich
  - Automatische Updates bei neuen Regelwerken
  - Versionsverwaltung für Regelwerke
  - Migrationsmechanismen bei Regeländerungen

## 7. Priorisierung

### Hoch (MVP - Minimum Viable Product)
- Grundlegendes Attributs- und Fertigkeitssystem
- Probenmechanik
- Einfache Charaktererschaffung
- Grundlegende Ausrüstungsdaten

### Mittel
- Magie/Resonance-System
- Erweiterte Kampfregeln
- Vorteile/Nachteile
- Lifestyle-System

### Niedrig
- Erweiterte optionale Regeln
- Quellenbuch-Integration
- Erweiterte UI-Features
- Export-Funktionen
