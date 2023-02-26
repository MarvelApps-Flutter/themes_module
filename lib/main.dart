import 'package:dark_and_light_mode_module/provider/theme_provider.dart';
import 'package:dark_and_light_mode_module/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Light and Dark Mode Demo 1',
            debugShowCheckedModeBanner: false,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.themeData(themeProvider.themeName),
            darkTheme: MyThemes.themeData(themeProvider.themeName),
            home: const SplashScreen(),
          );
        },
      );
}
