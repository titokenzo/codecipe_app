import 'package:codecipe/views/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

///Widget principal (main)
class MyApp extends StatelessWidget {
  static const String _title = 'Defesa Civil - PE';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
    );
  }
}
