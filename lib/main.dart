import 'package:flutter/material.dart';
import 'package:web_app/WebPages/Login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      themeMode: ThemeMode.system,
      home: const LoginPage(),
    );
  }
}

class ThemeClass {
  Color lightPrimaryColor = Colors.blue.shade900;
  Color darkPrimaryColor = Colors.lightBlue;
  Color lightSecondaryColor = Colors.black;
  Color darkSecondaryColor = Colors.white;

  static ThemeData lightTheme = ThemeData(
        primaryColor: ThemeData.light().scaffoldBackgroundColor,
        colorScheme: ColorScheme.light().copyWith(primary: themeClass.lightPrimaryColor, secondary: themeClass.lightSecondaryColor),
  );
  static ThemeData darkTheme = ThemeData(
        primaryColor: ThemeData.dark().scaffoldBackgroundColor,
        colorScheme: ColorScheme.dark().copyWith(primary: themeClass.darkPrimaryColor, secondary: themeClass.darkSecondaryColor),
  );
}

ThemeClass themeClass = ThemeClass();