import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/ingrediente_model.dart';

class principalPesquisa extends StatefulWidget {
  @override
  _principalPesquisaState createState() => _principalPesquisaState();
}

class _principalPesquisaState extends State<principalPesquisa> {
  static List<ReceitaModel> receita_list = [
    ReceitaModel(
      'Arroz com Feijão',
      'Feijão',
      'Nível: Fácil',
    ),
    ReceitaModel(
      'Macarrão ao alho e óleo',
      'Alho',
      'Nível: Médio',
    ),
    ReceitaModel(
      'Churrasco',
      'Carne',
      'Nível: Difícil',
    ),
    ReceitaModel(
      'Sopa',
      'Batata',
      'Nível: Médio',
    ),
    ReceitaModel(
      'Bolo de cenoura',
      'Cenoura',
      'Nível: Médio',
    ),
    ReceitaModel(
      'Bolo de cenoura',
      'Cenoura',
      'Nível: Médio',
    ),
    ReceitaModel(
      'Bolo de cenoura',
      'Cenoura',
      'Nível: Médio',
    ),
  ];

  List<ReceitaModel> display_list = List.from(receita_list);

  void updateList(String value) {
    setState(() {
      display_list = receita_list
          .where((element) => element.receita_ingredientes!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Pesquisar Receita',
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
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Ingrediente',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
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
                      trailing: Text(
                        '${display_list[index].receita_dificuldade}',
                        style: TextStyle(
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
