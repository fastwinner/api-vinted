import 'package:flutter/material.dart';
import 'AuthPerso/Accueil.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Accueil(),
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
    );
  }
}
