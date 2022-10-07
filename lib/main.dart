import 'package:flutter/material.dart';
import 'package:piattov2/cadastro_receita.dart';
import 'package:piattov2/sobre.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PIATTO',
      home: Sobre(),
    );
  }
}

