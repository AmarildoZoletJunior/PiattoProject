import 'package:flutter/material.dart';
import 'package:piattov2/Component/ButtonPages.dart';
import 'package:piattov2/account/tela_login.dart';
import 'package:piattov2/animation.dart';
import 'package:piattov2/principal_pesquisa.dart';
import 'package:piattov2/receita_solo.dart';
import 'package:piattov2/sobre.dart';

import 'account/tela_principal.dart';
import 'cadastro_receita.dart';
import 'favorito.dart';
import 'minhas_receitas.dart';

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
      home: receitaSolo(),
    );
  }
}
