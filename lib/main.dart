import 'package:flutter/material.dart';

import 'package:bill_splitter/bill_splitter_screen.dart';

final theme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF6C63FF),
    secondary: Color(0xFF00BFA5),
    surface: Color(0xFF1E1E1E),
    onSurface: Colors.white,
  ),
  fontFamily: 'Lexend',
  appBarTheme: const AppBarThemeData(
    titleTextStyle: TextStyle(
      fontFamily: 'Lexend',
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
  ),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const BillSplitterScreen(),
    );
  }
}
