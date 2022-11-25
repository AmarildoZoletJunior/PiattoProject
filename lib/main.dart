import 'package:flutter/material.dart';
import 'package:piattov2/Component/ButtonPages.dart';
import 'package:piattov2/account/tela_login.dart';

import 'account/tela_principal.dart';

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
      home: Stela_principal(),
    );
  }
}

