import 'package:flutter/material.dart';
import 'package:gng/view/MyHome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parsing Json',
      home: new MyHome(),
    );
  }
}
