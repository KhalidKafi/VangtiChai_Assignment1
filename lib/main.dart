// Entry point for the VangtiChai Flutter application
import 'package:flutter/material.dart';
import 'src/screens/home_screen.dart';

void main() => runApp(VangtiChaiApp());

class VangtiChaiApp extends StatelessWidget {
  const VangtiChaiApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'VangtiChai',
    home: HomeScreen(),
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF036E60),
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
    ),
  );
}
