import 'package:flutter/material.dart';
import 'game_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solitaire',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const GameScreen(),
    );
  }
}