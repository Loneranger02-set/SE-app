import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'menuPage.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter login UI',
      debugShowCheckedModeBanner: false,
      home:MenuScreen(),
    );
  }
}