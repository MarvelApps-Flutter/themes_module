import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  String themeName = "light";

  void toggleTheme(String theme) {
    themeName = theme;
    notifyListeners();
  }
}

class MyThemes {
  static ThemeData themeData(String themeName) {
    switch (themeName) {
      case "Ambrish":
        return ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 186, 170, 48),
          primaryColor: Colors.amber.shade200,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Color(0xFF646F75)),
            labelSmall: TextStyle(color: Color(0xAA474B4B)),
          ),
          shadowColor: const Color.fromARGB(170, 181, 181, 100),
          cardColor: const Color.fromARGB(255, 183, 161, 0),
          colorScheme: const ColorScheme.dark(),
          canvasColor: const Color(0xFF646E79),
          iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 68, 154, 108), opacity: 0.8),
          bottomAppBarTheme:
              const BottomAppBarTheme(color: Color.fromARGB(255, 89, 113, 210)),
        );

      case "Redish":
        return ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 222, 125, 125),
          primaryColor: Colors.red.shade200,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Color.fromARGB(255, 125, 51, 51)),
            labelSmall: TextStyle(color: Color(0xAA474B4B)),
          ),
          shadowColor: const Color.fromARGB(170, 206, 100, 100),
          cardColor: const Color.fromARGB(255, 210, 111, 45),
          colorScheme: const ColorScheme.dark(),
          canvasColor: const Color(0xFF646E79),
          iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 221, 51, 62), opacity: 0.8),
          bottomAppBarTheme:
              const BottomAppBarTheme(color: Color.fromARGB(255, 89, 210, 206)),
        );

      case "Pinkish":
        return ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 201, 106, 157),
          primaryColor: Colors.pink.shade200,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Color.fromARGB(255, 125, 21, 21)),
            labelSmall: TextStyle(color: Color(0xAA474B4B)),
          ),
          shadowColor: const Color.fromARGB(170, 191, 43, 129),
          cardColor: const Color.fromARGB(255, 105, 33, 96),
          colorScheme: const ColorScheme.dark(),
          canvasColor: const Color(0xFF646E79),
          iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 68, 154, 108), opacity: 0.8),
          bottomAppBarTheme:
              const BottomAppBarTheme(color: Color.fromARGB(255, 150, 89, 210)),
        );

      case "Orange":
        return ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 210, 136, 67),
          primaryColor: Colors.orange.shade200,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Color.fromARGB(255, 83, 16, 128)),
            labelSmall: TextStyle(color: Color(0xAA474B4B)),
          ),
          shadowColor: const Color.fromARGB(170, 15, 179, 15),
          cardColor: const Color.fromARGB(255, 92, 56, 2),
          colorScheme: const ColorScheme.dark(),
          canvasColor: const Color(0xFF646E79),
          iconTheme: const IconThemeData(
              color: Color.fromARGB(255, 68, 154, 108), opacity: 0.8),
          bottomAppBarTheme:
              const BottomAppBarTheme(color: Color.fromARGB(255, 66, 151, 151)),
        );

      case "light":
        return ThemeData(
          scaffoldBackgroundColor: const Color(0xFF1B1F20),
          primaryColor: Colors.black,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Color(0xFF646F75)),
            labelSmall: TextStyle(color: Color(0xAA474B4B)),
          ),
          shadowColor: const Color(0xAA070909),
          cardColor: const Color(0xFF202125),
          colorScheme: const ColorScheme.dark(),
          canvasColor: const Color(0xFF646E79),
          iconTheme:
              const IconThemeData(color: Color(0xFF637079), opacity: 0.8),
          bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xFF505455)),
        );

      default:
        return ThemeData(
          scaffoldBackgroundColor: const Color(0xFFEBECED),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.black),
            bodyMedium: TextStyle(color: Color(0xFF9A99AD)),
            labelSmall: TextStyle(
              color: Colors.white,
            ),
          ),
          shadowColor: const Color(0xFFD0D3DB),
          primaryColor: Colors.white,
          cardColor: const Color(0xFFEDEEF0),
          canvasColor: Colors.blueGrey.shade200,
          colorScheme: const ColorScheme.light(),
          iconTheme:
              const IconThemeData(color: Color(0xFFA0A0AA), opacity: 0.8),
          bottomAppBarTheme: BottomAppBarTheme(color: Colors.blueGrey.shade200),
        );
    }
  }
}
