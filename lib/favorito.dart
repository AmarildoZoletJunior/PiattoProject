import 'package:flutter/material.dart';

class Favoritos extends StatefulWidget {
  const Favoritos({Key? key}) : super(key: key);

  @override
  State<Favoritos> createState() => _FavoritosState();
}

class _FavoritosState extends State<Favoritos> {
  int _opcaoSelecionada = 0;
  final double _borderRadius = 24;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.white, Colors.green],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red,
                      blurRadius: 12,
                      offset: Offset(0,6),
                    )
                  ]
                ),
                
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _opcaoSelecionada,
        onTap: (opcao) {
          print('clicou $opcao');

          setState((){
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
      )
    );
  }
}

