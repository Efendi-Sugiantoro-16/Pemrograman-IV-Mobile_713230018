import 'package:flutter/material.dart';
import './material_page.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Material Design App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF0051BA),        // Serbian Blue
          onPrimary: Colors.white,
          secondary: Color(0xFFC4373C),       // Serbian Red
          onSecondary: Colors.white,
          tertiary: Colors.white,
          onTertiary: Color(0xFF0051BA),
          error: Colors.red,
          onError: Colors.white,
          background: Colors.white,
          onBackground: Color(0xFF0051BA),
          surface: Colors.white,
          onSurface: Color(0xFF0051BA),
          outline: Color(0xFF0051BA),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
          backgroundColor: Color(0xFF0051BA), // Blue AppBar
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFC4373C), // Red buttons
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF0051BA), // Blue bottom nav
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xFFE0E0E0),
        ),
      ),
      home: const HomePage(),
    );
  }
}
