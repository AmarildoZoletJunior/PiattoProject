import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/ingrediente_model.dart';

class minhasReceitas extends StatefulWidget {
  const minhasReceitas({Key? key}) : super(key: key);

  @override
  State<minhasReceitas> createState() => _minhasReceitasState();
}

class _minhasReceitasState extends State<minhasReceitas> {
  static List<ReceitaModel> receita_list = [
    ReceitaModel(
      'Arroz com Feijão',
      'Feijão',
    ),
  ];
  List<ReceitaModel> display_list = List.from(receita_list);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Minhas Receitas',
          style: GoogleFonts.italiana(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
        child: ListView.builder(
          itemCount: receita_list.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 250,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                title: Text(
                  display_list[index].receita_nome!,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '${display_list[index].receita_ingredientes!}',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                trailing: Wrap(
                  spacing: 15,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.create_rounded),
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.delete_rounded),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
