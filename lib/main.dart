import 'package:flutter/material.dart';
import 'auth.dart';
import 'home_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
      primarySwatch: Colors.deepOrange,
      brightness:Brightness.light ,
      ),
    home:HomePage(),
     
    );
  }
}
