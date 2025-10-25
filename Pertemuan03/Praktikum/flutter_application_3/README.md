# Flutter Material Design Application 🇷🇸

Aplikasi Flutter dengan implementasi Material Design dan Stateful Widget untuk Praktikum Pemrograman Mobile dengan **Serbian Flag Color Theme**.

## Fitur

- ✅ **Material Design Components**
  - AppBar dengan navigation
  - Drawer navigation menu
  - BottomNavigationBar
  - Custom Heading widget (Stateless)
  - BiggerText widget (Stateful) dengan tombol Perbesar

- ✅ **Stateful Widget Implementation**
  - BiggerText dengan state management
  - Text size **toggle** (16.0 ↔ 32.0)
  - **Dynamic button text**: "Perbesar" / "Perkecil"
  - Interactive ElevatedButton dengan conditional logic
  - Dynamic UI updates dengan setState()

- ✅ **Navigation**
  - Home Page dengan BiggerText "Hello ULBI"
  - About Page dengan BiggerText "Tentang ULBI"
  - Navigation antara halaman menggunakan drawer dan bottom navigation

- ✅ **UI Components**
  - Column layout dengan mainAxisAlignment
  - ElevatedButton dengan onPressed callback
  - Text styling dengan fontSize state
  - Responsive design

## Struktur File

```
lib/
├── main.dart              # Entry point aplikasi
├── material_app.dart      # MaterialApp configuration
├── material_page.dart     # HomePage dengan BiggerText
├── about_page.dart        # AboutPage dengan BiggerText
├── heading.dart           # Reusable Heading widget (Stateless)
└── bigger_text.dart       # Interactive BiggerText widget (Stateful)
```

## Cara Menjalankan

1. Pastikan Flutter SDK sudah terinstall
2. Jalankan `flutter pub get`
3. Jalankan `flutter run`

## Navigation Flow

- **Home Page**: Menampilkan "Hello ULBI" dengan tombol Perbesar
- **About Page**: Menampilkan "Tentang ULBI" dengan tombol Perbesar
- **Drawer Menu**: Navigation menu di sidebar
- **Bottom Navigation**: Quick navigation dengan icons

## Interactive Features

- **BiggerText Widget**: Text dengan ukuran awal 16.0
- **Toggle Button**: 
  - Menampilkan "Perbesar" saat text size = 16.0
  - Menampilkan "Perkecil" saat text size = 32.0

## Enhanced Features

- **Clean Architecture**: main.dart hanya berisi entry point
- **Enhanced Theming**: Material Design 3 dengan **Serbian flag colors**
- **Better AppBar**: Centered title dengan elevation
- **Styled Buttons**: Custom ElevatedButton theming
- **Testing**: Updated widget tests untuk BiggerText functionality

## 🇷🇸 Serbian Flag Color Theme

- **Primary Blue**: `#0051BA` (AppBar, Bottom Navigation)
- **Secondary Red**: `#C4373C` (Buttons, Accents)
- **Background White**: `#FFFFFF` (Clean backgrounds)
- **Gradient Effects**: Blue-to-Red gradients in drawer headers
- **Typography**: Blue text on white backgrounds

## Code Implementation

```dart
// Conditional Button Text
child: Text(_textSize == 16.0 ? "Perbesar" : "Perkecil"),

// Toggle Logic  
onPressed: () {
  setState(() {
    _textSize = _textSize == 16.0 ? 32.0 : 16.0;
  });
},
```

## Teknologi

- Flutter SDK
- Dart Programming Language
- Material Design 3
- State Management (StatefulWidget)
- Navigation & Routing
