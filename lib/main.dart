import 'package:flutter/material.dart';
import 'screens/user_selector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroConecta',
      theme: ThemeData(
        primaryColor: Colors.green[300],
        scaffoldBackgroundColor: Color(0xFFE8F5E9),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.grey[800])),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: UserSelectorScreen(),
    );
  }
}
