Bezugnehmend auf "1-Anforderungsanalyse.md", "2-Architektur.md", "3-Datenmodelle.md" und `lib/theme/app_theme.dart`

# UI/UX-Design - Shadowrun 2. Edition Charaktergenerator

## 1. Design-Prinzipien

### 1.1 KISS-Prinzip (Keep It Simple, Stupid)
- **Minimale kognitive Belastung**: Keine überflüssigen Informationen auf einmal
- **Progressive Disclosure**: Komplexe Optionen erst bei Bedarf anzeigen
- **Konsistenz**: Gleiche Interaktionen für gleiche Aktionen
- **Klarheit vor Ästhetik**: Funktion vor Form

### 1.2 Barrierefreiheit (Neurodivergenz-freundlich)
- ✅ **Hoher Kontrast**: WCAG 2.1 Level AA (mindestens 4.5:1 für Text)
- ✅ **Reduzierte Ablenkung**: Keine Animationen ohne Nutzer-Trigger
- ✅ **Vorhersagbarkeit**: Konsistente Navigation und Layouts
- ✅ **Fehler-Toleranz**: Klare Fehlermeldungen mit Lösungsvorschlägen
- ✅ **Anpassbarkeit**: Schriftgröße, Kontrast, Theme anpassbar
- ✅ **Keine Zeitlimits**: Nutzer kontrolliert das Tempo
- ✅ **Einfache Sprache**: Klare, präzise Beschriftungen

### 1.3 Shadowrun-Ästhetik
- **Cyberpunk-Modern**: Subtile futuristische Elemente
- **Dunkle Themes**: Primär Dark Mode (reduziert Augenbelastung)
- **Farbcodierung**: 
  - Rot: Gefahr, Fehler, kritische Werte
  - Grün: Erfolg, gültig, positive Werte
  - Gelb: Warnung, Aufmerksamkeit
  - Blau: Information, interaktive Elemente
  - Lila: Magie/Resonanz (bestehendes Seed-Color)

---

## 2. Design-System

### 2.1 Farbpalette (Erweitert aus app_theme.dart)

```dart
// lib/theme/app_theme.dart - Erweitert
class AppTheme {
  // Bestehende Themes beibehalten und erweitern
  static final lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: baseTextTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.light,
      // Erweiterte Farben
      primary: Colors.purple,
      secondary: Colors.cyan,
      error: Colors.red,
      surface: Colors.white,
      onSurface: Colors.black87,
    ),
    // Barrierefreiheit: Hoher Kontrast
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.grey[50],
  );
  
  static final darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: baseTextTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.dark,
      // Erweiterte Farben
      primary: Colors.purple[300],
      secondary: Colors.cyan[300],
      error: Colors.red[300],
      surface: Colors.grey[900],
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.grey[900],
    cardColor: Colors.grey[850],
  );
  
  // Semantic Colors für Regel-spezifische Darstellung
  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const Color error = Colors.red;
  static const Color info = Colors.blue;
  static const Color magic = Colors.purple;
  static const Color matrix = Colors.cyan;
  static const Color physical = Colors.brown;
  
  // Accessibility: High Contrast Mode
  static ThemeData get highContrastLightTheme {
    return lightTheme.copyWith(
      colorScheme: lightTheme.colorScheme.copyWith(
        onSurface: Colors.black,
        surface: Colors.white,
      ),
    );
  }
  
  static ThemeData get highContrastDarkTheme {
    return darkTheme.copyWith(
      colorScheme: darkTheme.colorScheme.copyWith(
        onSurface: Colors.white,
        surface: Colors.black,
      ),
    );
  }
}
```

### 2.2 Typografie (Bestehend aus app_theme.dart beibehalten)

**Aktuelle Struktur**:
- **Display**: Poppins (57, 45, 36px) - Hero-Texte
- **Headline**: Poppins (32, 28, 24px) - Überschriften
- **Title**: Lato (22, 18, 16px) - Komponenten-Titel
- **Body**: Lato (16, 14, 12px) - Fließtext
- **Label**: Lato (14, 12, 11px) - Beschriftungen

**Ergänzungen für Barrierefreiheit**:
```dart
static final TextTheme accessibleTextTheme = TextTheme(
  // Vergrößerte Basis-Schriftgrößen
  bodyLarge: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w400),
  bodyMedium: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w400),
  bodySmall: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.w400),
  
  // Höhere Zeilenhöhe für bessere Lesbarkeit
  bodyLarge: GoogleFonts.lato(
    fontSize: 18, 
    fontWeight: FontWeight.w400,
    height: 1.6,  // Zeilenhöhe erhöht
  ),
);
```

### 2.3 Abstände und Layout

```dart
class AppSpacing {
  // 8pt Grid System
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
  static const double xxl = 48.0;
  
  // Component-spezifische Abstände
  static const double cardPadding = md;
  static const double buttonHeight = 48.0;  // Mindestens 48px für Touch-Targets
  static const double inputHeight = 56.0;
  static const double listItemHeight = 64.0;
}

class AppBorderRadius {
  static const double sm = 4.0;
  static const double md = 8.0;
  static const double lg = 12.0;
  static const double xl = 16.0;
}
```

### 2.4 ThemeSwitcher Implementierung

```dart
// lib/theme/theme_switcher.dart
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'app_theme.dart';

enum ThemeOption {
  light,
  dark,
  system,
  highContrastLight,
  highContrastDark,
}

@riverpod
class ThemeSwitcher extends _$ThemeSwitcher {
  @override
  ThemeOption build() {
    // Lade gespeicherte Einstellung
    final saved = _loadThemePreference();
    return saved ?? ThemeOption.system;
  }
  
  void setTheme(ThemeOption option) {
    state = option;
    _saveThemePreference(option);
  }
  
  ThemeMode get themeMode {
    switch (state) {
      case ThemeOption.light:
        return ThemeMode.light;
      case ThemeOption.dark:
        return ThemeMode.dark;
      case ThemeOption.highContrastLight:
        return ThemeMode.light;
      case ThemeOption.highContrastDark:
        return ThemeMode.dark;
      case ThemeOption.system:
      default:
        return ThemeMode.system;
    }
  }
  
  ThemeData get themeData {
    final platformBrightness = WidgetsBinding.instance.window.platformBrightness;
    final isDark = platformBrightness == Brightness.dark;
    
    switch (state) {
      case ThemeOption.light:
        return AppTheme.lightTheme;
      case ThemeOption.dark:
        return AppTheme.darkTheme;
      case ThemeOption.highContrastLight:
        return AppTheme.highContrastLightTheme;
      case ThemeOption.highContrastDark:
        return AppTheme.highContrastDarkTheme;
      case ThemeOption.system:
      default:
        return isDark ? AppTheme.darkTheme : AppTheme.lightTheme;
    }
  }
  
  void _saveThemePreference(ThemeOption option) {
    // Speichere in SharedPreferences
    // TODO: Implementierung
  }
  
  ThemeOption? _loadThemePreference() {
    // Lade aus SharedPreferences
    // TODO: Implementierung
    return null;
  }
}

// Verwendung in main.dart
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeSwitcher = ref.watch(themeSwitcherProvider);
    
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeSwitcher.themeMode,
      home: HomeScreen(),
    );
  }
}
```

---

## 3. Screen-Designs

### 3.1 Navigation-Konzept

**Bottom Navigation Bar** (Mobile) / **Navigation Rail** (Desktop):
```
┌─────────────────────────────────────┐
│  🏠 Home    📋 Characters    ⚙️ Settings │
└─────────────────────────────────────┘
```

**Drawer Navigation** (Zusätzlich für Desktop):
- Dashboard
- Charakter erstellen
- Charaktere verwalten
- Regelwerke
- Einstellungen

### 3.2 Home Screen

```
┌─────────────────────────────────────┐
│  Shadowrun 2e Character Generator   │
│  ─────────────────────────────────  │
│                                     │
│  ┌───────────────────────────────┐  │
│  │  🎯 Neuer Charakter           │  │
│  │  Starte die Charaktererschaffung│ │
│  └───────────────────────────────┘  │
│                                     │
│  ┌───────────────────────────────┐  │
│  │  📋 Meine Charaktere (3)      │  │
│  │  - Street Samurai (Lvl 5)    │  │
│  │  - Decker (Lvl 3)            │  │
│  │  - Mage (Lvl 7)              │  │
│  └───────────────────────────────┘  │
│                                     │
│  ┌───────────────────────────────┐  │
│  │  📚 Regelwerke               │  │
│  │  - SR2 Grundregeln (v1.2)    │  │
│  │  - Chromebook (v1.0)         │  │
│  └───────────────────────────────┘  │
└─────────────────────────────────────┘
```

**Design-Spezifikation**:
- Große Touch-Targets (min. 48x48px)
- Klare visuelle Hierarchie
- Wenige Elemente pro Screen (max. 3-4 Hauptaktionen)
- Beschreibende Labels + Icons

### 3.3 Character Creation Flow

**Schritt-für-Schritt Wizard** (kein langes Formular):

```
Schritt 1: Metatyp wählen
┌─────────────────────────────────────┐
│  Schritt 1/5: Metatyp               │
│  ─────────────────────────────────  │
│                                     │
│  Wähle deinen Metatypen:            │
│                                     │
│  ┌──────────┐ ┌──────────┐         │
│  │  Mensch   │ │   Elf    │         │
│  │  +0       │ │  +2 QS   │         │
│  │  +1 alle  │ │  +2 QN   │         │
│  └──────────┘ └──────────┘         │
│                                     │
│  ┌──────────┐ ┌──────────┐         │
│  │  Zwerg   │ │   Ork    │         │
│  │  +1 KO   │ │  +3 KO   │         │
│  │  +2 WI   │ │  +2 ST   │         │
│  └──────────┘ └──────────┘         │
│                                     │
│  ┌──────────┐                       │
│  │  Troll   │                       │
│  │  +4 ST   │                       │
│  │  +1 KO   │                       │
│  └──────────┘                       │
│                                     │
│  [Zurück]              [Weiter →]  │
└─────────────────────────────────────┘
```

**Design-Spezifikation**:
- Ein Wizard mit 5-7 Schritten
- Max. 2-3 Optionen pro Screen
- Große, klickbare Cards
- Klare "Zurück/Weiter" Navigation
- Progress-Indicator (Schritt X von Y)

### 3.4 Character Detail Screen

```
┌─────────────────────────────────────┐
│  ← Street Samurai                   │
│  ─────────────────────────────────  │
│                                     │
│  ┌─ Attribute ──────────────────┐   │
│  │  Body: 6    Quick: 5         │   │
│  │  STR:  7    CHA:  3         │   │
│  │  INT:  4    WIL:  5         │   │
│  │  Essence: 5.5  Magic: 0     │   │
│  │  Edge: 3    Initiative: 12  │   │
│  └──────────────────────────────┘   │
│                                     │
│  ┌─ Fertigkeiten ──────────────┐    │
│  │  Schießen: 5  (Spez: Pist.) │    │
│  │  Nahkampf: 4                │    │
│  │  Wahrnehmung: 3             │    │
│  │  [+ Alle anzeigen]          │    │
│  └──────────────────────────────┘   │
│                                     │
│  ┌─ Ausrüstung ────────────────┐    │
│  │  Waffen:                     │    │
│  │  • Ares Predator VI         │    │
│  │  • Katana                   │    │
│  │  Rüstung:                    │    │
│  │  • Armor Jacket (12)        │    │
│  │  [+ Alle anzeigen]          │    │
│  └──────────────────────────────┘   │
│                                     │
│  ┌─ Vorteile ─────────────────┐    │
│  │  ✓ Schnelle Heilung (6 Karma) │  │
│  │  ✓ High Pain Tolerance (7)  │    │
│  └──────────────────────────────┘   │
│                                     │
│  [Bearbeiten]  [Export]  [Löschen]  │
└─────────────────────────────────────┘
```

**Design-Spezifikation**:
- Expandable Sections (Accordion)
- Farbcodierung: Attribute (Blau), Fertigkeiten (Grün), Ausrüstung (Gelb)
- Icons für schnelle Erkennung
- "Alle anzeigen" Button für lange Listen
- Floating Action Buttons für Hauptaktionen

### 3.5 Validation Error Screen

```
┌─────────────────────────────────────┐
│  ⚠️ Validierungsfehler              │
│  ─────────────────────────────────  │
│                                     │
│  ❌ Essence zu niedrig              │
│  Cyberware benötigt 6.5 Essence,    │
│  aber nur 5.5 verfügbar.            │
│  [Lösung: Entferne Cyberware]      │
│                                     │
│  ❌ Attributs-Limit überschritten   │
│  Body (7) überschreitet Maximum    │
│  von 6 für Metatyp "Mensch".       │
│  [Lösung: Reduziere auf 6]         │
│                                     │
│  ⚠️ Warnung: Essence < 6           │
│  Magic wird um 1 Punkt reduziert.   │
│                                     │
│  [Fehler beheben]  [Ignorieren]    │
└─────────────────────────────────────┘
```

**Design-Spezifikation**:
- Rote Icons für Errors, Gelb für Warnings
- Klare Fehlerbeschreibung
- Automatische Lösungsvorschläge
- "Ignorieren" Option für erfahrene Nutzer
- Kein Blockieren des Workflows

---

## 4. Component Library

### 4.1 Buttons

```dart
// Primary Button (Hauptaktionen)
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isEnabled;
  
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.isEnabled = true,
  });
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, AppSpacing.buttonHeight),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Text(label, style: Theme.of(context).textTheme.labelLarge),
    );
  }
}

// Secondary Button (Nebenaktionen)
class SecondaryButton extends StatelessWidget {
  // Ähnlich, aber mit outline Style
}

// Icon Button (Toolbar)
class IconTextButton extends StatelessWidget {
  // Icon + Text kombiniert
}
```

### 4.2 Input Fields

```dart
class SR2TextField extends StatelessWidget {
  final String label;
  final String? value;
  final ValueChanged<String> onChanged;
  final String? errorText;
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.md),
        ),
        // Großer Touch-Target
        contentPadding: EdgeInsets.all(AppSpacing.md),
      ),
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

// Slider für Attribute
class AttributeSlider extends StatelessWidget {
  final String attributeName;
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(attributeName, style: Theme.of(context).textTheme.titleMedium),
        Slider(
          value: value.toDouble(),
          min: min.toDouble(),
          max: max.toDouble(),
          divisions: max - min,
          label: value.toString(),
          onChanged: onChanged,
        ),
        // Großer Touch-Bereich
        SizedBox(height: AppSpacing.sm),
      ],
    );
  }
}
```

### 4.3 Cards

```dart
class SR2Card extends StatelessWidget {
  final String title;
  final Widget? subtitle;
  final List<Widget> children;
  final VoidCallback? onTap;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.all(AppSpacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppBorderRadius.md),
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                Text(title, style: Theme.of(context).textTheme.titleLarge),
              if (subtitle != null) subtitle!,
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}

// Metatype Selection Card
class MetatypeCard extends StatelessWidget {
  final Metatype metatype;
  final bool isSelected;
  final VoidCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    return SR2Card(
      title: metatype.name,
      subtitle: Text('+${metatype.bonus.values.join(", +")} Attribute'),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected 
              ? Theme.of(context).colorScheme.primary 
              : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...metatype.bonus.entries.map((e) => 
              Text('+${e.value} ${e.key}')
            ),
          ],
        ),
      ),
    );
  }
}
```

### 4.4 Validation Feedback

```dart
class ValidationMessage extends StatelessWidget {
  final String message;
  final ValidationSeverity severity;
  final String? solution;
  
  @override
  Widget build(BuildContext context) {
    final color = severity == ValidationSeverity.error
      ? Theme.of(context).colorScheme.error
      : Theme.of(context).colorScheme.warning;
    
    return Container(
      padding: EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(AppBorderRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                severity == ValidationSeverity.error 
                  ? Icons.error 
                  : Icons.warning,
                color: color,
              ),
              SizedBox(width: AppSpacing.sm),
              Text(
                severity == ValidationSeverity.error ? 'Fehler' : 'Warnung',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.sm),
          Text(message, style: Theme.of(context).textTheme.bodyMedium),
          if (solution != null) ...[
            SizedBox(height: AppSpacing.sm),
            TextButton(
              onPressed: () {}, // TODO: Implement solution
              child: Text('Lösung: $solution'),
            ),
          ],
        ],
      ),
    );
  }
}
```

---

## 5. Accessibility Guidelines

### 5.1 WCAG 2.1 Level AA Konformität

**Kontrast-Verhältnisse**:
- Normaler Text (< 18px): Mindestens 4.5:1
- Großer Text (≥ 18px): Mindestens 3:1
- UI-Komponenten: Mindestens 3:1

**Touch-Targets**:
- Mindestens 48x48px für alle interaktiven Elemente
- Mindestens 8px Abstand zwischen Touch-Targets

**Schriftgrößen**:
- Minimum: 12px (Labels)
- Standard: 14-16px (Body)
- Skalierbar bis 200% ohne Layout-Break

### 5.2 Neurodivergenz-spezifische Anpassungen

```dart
class AccessibilitySettings {
  // Schriftgröße (100%, 125%, 150%, 200%)
  double textScaleFactor;
  
  // Hoher Kontrast-Modus
  bool highContrast;
  
  // Animationen reduzieren
  bool reduceMotion;
  
  // Farbenblindheit-Modi
  ColorBlindnessMode colorBlindnessMode; // None, Protanopia, Deuteranopia, Tritanopia
  
  // Lesbarkeit
  bool increaseLineHeight;
  bool boldText;
  
  // Ablenkungsfrei
  bool hideNonEssentialElements;
}
```

**Implementierung**:
```dart
class SR2App extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accessibility = ref.watch(accessibilitySettingsProvider);
    
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          // Text-Skalierung
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: accessibility.textScaleFactor,
          ),
          child: child!,
        );
      },
      theme: accessibility.highContrast 
        ? AppTheme.highContrastLightTheme 
        : AppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}
```

### 5.3 Screen Reader Support

```dart
// Semantische Labels für alle interaktiven Elemente
Semantics(
  label: 'Attribut Stärke, Wert 7, maximal 10',
  hint: 'Doppelklick zum Bearbeiten',
  button: true,
  child: AttributeValue(
    name: 'Strength',
    value: 7,
    max: 10,
  ),
)

// Live Regions für dynamische Updates
Semantics(
  liveRegion: true,
  onChanged: (value) => 'Neuer Wert: $value',
  child: Slider(...),
)
```

---

## 6. Responsive Design

### 6.1 Breakpoints

```dart
class ResponsiveBreakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
  
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobile;
  }
  
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobile && width < desktop;
  }
  
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktop;
  }
}
```

### 6.2 Adaptive Layouts

**Mobile (< 600px)**:
- Bottom Navigation Bar
- Single Column Layout
- Vollbild-Dialoge für Wizard-Steps

**Tablet (600-1200px)**:
- Navigation Rail (links)
- 2-Column Layout wo sinnvoll
- Split-View für Character Details

**Desktop (> 1200px)**:
- Permanent Navigation Rail
- 3-Column Layout
- Side-by-Side Character Editor

```dart
class AdaptiveScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (ResponsiveBreakpoints.isDesktop(context)) {
      return Row(
        children: [
          NavigationRail(...),
          Expanded(child: content),
        ],
      );
    } else if (ResponsiveBreakpoints.isTablet(context)) {
      return Row(
        children: [
          NavigationRail(...),
          Expanded(child: content),
        ],
      );
    } else {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(...),
        body: content,
      );
    }
  }
}
```

---

## 7. Design Tokens

### 7.1 Zentrales Token-System

```dart
class DesignTokens {
  // Colors
  static const Color primary = Colors.purple;
  static const Color secondary = Colors.cyan;
  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const Color error = Colors.red;
  static const Color magic = Colors.purple;
  static const Color matrix = Colors.cyan;
  
  // Spacing
  static const double spacingXS = 4;
  static const double spacingSM = 8;
  static const double spacingMD = 16;
  static const double spacingLG = 24;
  static const double spacingXL = 32;
  
  // Border Radius
  static const double radiusSM = 4;
  static const double radiusMD = 8;
  static const double radiusLG = 12;
  
  // Elevation
  static const double elevationSM = 2;
  static const double elevationMD = 4;
  static const double elevationLG = 8;
  
  // Animation Duration
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);
}
```

### 7.2 Verwendung in Components

```dart
class SR2Card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: DesignTokens.elevationSM,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusMD),
      ),
      margin: EdgeInsets.all(DesignTokens.spacingSM),
      child: Padding(
        padding: EdgeInsets.all(DesignTokens.spacingMD),
        child: content,
      ),
    );
  }
}
```

---

## 8. Implementierungsbeispiele

### 8.1 Character Creation Screen

```dart
class CharacterCreationScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<CharacterCreationScreen> createState() => _CharacterCreationState();
}

class _CharacterCreationState extends ConsumerState<CharacterCreationScreen> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charakter erstellen'),
        // Klare Navigation
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 4),
          child: LinearProgressIndicator(
            value: (_currentStep + 1) / 5,
            backgroundColor: Colors.grey[300],
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: _nextStep,
          onStepCancel: _previousStep,
          steps: [
            Step(
              title: Text('Metatyp'),
              content: MetatypeSelection(),
            ),
            Step(
              title: Text('Attribute'),
              content: AttributeAllocation(),
            ),
            Step(
              title: Text('Fertigkeiten'),
              content: SkillAllocation(),
            ),
            Step(
              title: Text('Magie/Resonanz'),
              content: MagicSelection(),
            ),
            Step(
              title: Text('Ausrüstung'),
              content: EquipmentSelection(),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 8.2 Attribute Slider mit Echtzeit-Validierung

```dart
class AttributeSlider extends ConsumerWidget {
  final String attributeName;
  final int value;
  final int min;
  final int max;
  final int pointsAvailable;
  
  const AttributeSlider({
    required this.attributeName,
    required this.value,
    required this.min,
    required this.max,
    required this.pointsAvailable,
  });
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final validation = ref.watch(attributeValidationProvider);
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(attributeName, style: Theme.of(context).textTheme.titleMedium),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: DesignTokens.spacingSM,
                vertical: DesignTokens.spacingXS,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(DesignTokens.radiusSM),
              ),
              child: Text(
                value.toString(),
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ],
        ),
        Slider(
          value: value.toDouble(),
          min: min.toDouble(),
          max: max.toDouble(),
          divisions: max - min,
          label: value.toString(),
          onChanged: (value) {
            // Update character
            ref.read(characterProvider.notifier).updateAttribute(
              attributeName,
              value.toInt(),
            );
          },
        ),
        if (validation.hasError)
          ValidationMessage(
            message: validation.errorMessage,
            severity: ValidationSeverity.error,
          ),
      ],
    );
  }
}
```

---

## 9. Nächste Schritte

1. **Component Library aufbauen**: Alle wiederverwendbaren Widgets implementieren
2. **Screen-Flows testen**: Mit echten Nutzern testen (insbesondere neurodivergente Personen)
3. **Theme-System finalisieren**: ThemeSwitcher in App integrieren
4. **Accessibility-Audit**: Mit Screen Readern testen (TalkBack, VoiceOver)
5. **Responsive Testing**: Auf allen Plattformen (Mobile, Tablet, Desktop) testen
6. **Performance**: Animationen optimieren, reduceMotion respektieren

---

## Referenzen

- **Anforderungen**: `1-Anforderungsanalyse.md` (§6.3 UI/UX-Konzept, Barrierefreiheit)
- **Architektur**: `2-Architektur.md` (Riverpod State Management)
- **Datenmodelle**: `3-Datenmodelle.md` (Character Entity)
- **Bestehendes Theme**: `lib/theme/app_theme.dart`
- **Standards**: WCAG 2.1 Level AA, Material Design 3