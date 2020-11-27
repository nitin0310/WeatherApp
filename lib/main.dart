import 'package:flutter/material.dart';
import 'package:weather/Dashboard.dart';
import 'package:weather/ScaffoldBody.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard()
    );
  }
}
