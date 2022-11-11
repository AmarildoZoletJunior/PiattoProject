import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _opcaoSelecionada = 0;
  final double _borderRadius = 24;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _opcaoSelecionada,
      onTap: (opcao) {
        print('clicou $opcao');

        setState(() {
          _opcaoSelecionada = opcao;
        });
      },
      fixedColor: Colors.amber,
      items: [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Favoritos",
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: "Adicionar",
          icon: Icon(Icons.add_box),
        ),
        BottomNavigationBarItem(
          label: "Perfil",
          icon: Icon(Icons.person),
        ),
        BottomNavigationBarItem(
          label: "Configuração",
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
