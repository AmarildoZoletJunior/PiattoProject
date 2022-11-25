import 'package:flutter/material.dart';
import 'package:piattov2/cadastro_receita.dart';
import 'package:piattov2/configuracao.dart';
import 'package:piattov2/favorito.dart';
import 'package:piattov2/minhas_receitas.dart';
import '../principal_pesquisa.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  int index = 0;
  final screens = [
    principalPesquisa(),
    favoritoPage(),
    cadastroReceita(),
    minhasReceitas(),
    configuracoes(),
  ];



  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        backgroundColor: Colors.transparent,
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              indicatorColor: Colors.green.shade300,
              labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              )),
          child: NavigationBar(
            height: 60,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.search),
                label: 'Pesquisar Receita',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_border_outlined),
                selectedIcon: Icon(Icons.favorite),
                label: 'Favoritos',
              ),
              NavigationDestination(
                icon: Icon(Icons.add_box_outlined),
                selectedIcon: Icon(Icons.add_box),
                label: 'Nova Receita',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Minhas Receitas',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: 'Configurações',
              ),
            ],
          ),
        ),
      );
}
