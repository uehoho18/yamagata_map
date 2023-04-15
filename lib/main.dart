import 'package:flutter/material.dart';
import 'package:yamagata_map/screens/tutorial_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '山形県観光アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TutorialScreen(), // ここでTutorialScreenを表示します。
    );
  }
}
