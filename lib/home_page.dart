import 'package:flutter/material.dart';
import 'package:piattov2/cadastro_receita.dart';
import 'package:piattov2/configuracao.dart';
import 'package:piattov2/favorito.dart';
import 'package:piattov2/sobre.dart';
import 'package:piattov2/tela_seleciona_ingredientes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState(){
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }
  setPaginaAtual(pagina){
    setState(() {
      paginaAtual = pagina;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          seleciona_ingrediente(),
          Favoritos(),
          cadastro_receita(),
          Sobre(),
          Config(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        type: BottomNavigationBarType.fixed,
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
        )
        ],
        onTap: (pagina){
          pc.animateToPage(pagina,
                          duration: Duration(microseconds: 400),
              curve: Curves.ease);
        },
      )
    );
  }
}

