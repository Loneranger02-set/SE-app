import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'menuPage.dart';
import 'dart:async';
void main() {
  runApp(MyApp());
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text('VISION',textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color:Colors.black
          )),
        decoration: BoxDecoration(

          color: Colors.white,

        image: DecorationImage(
        image: AssetImage(
        'assets/images/download.jpg'),

    ),
    ),);
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter login UI',
      debugShowCheckedModeBanner: false,
      home:MyHomePage(),
    );
  }
}