import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:http/http.dart" as http;
import 'package:piattov2/data/ReceitaLista.dart';
import 'package:piattov2/receita_solo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class resultadoPesquisa extends StatefulWidget {
   String text;
   bool decisao;

   resultadoPesquisa({Key? key,required this.text,required this.decisao}) : super(key: key);
  @override
  State<resultadoPesquisa> createState() => _resultadoPesquisaState(text,decisao);
}

class _resultadoPesquisaState extends State<resultadoPesquisa> {
  String texto;
  bool deciso;

  _resultadoPesquisaState(this.texto, this.deciso);

  late Future<List<ReceitaLista>> receitas;

  @override
  void initState() {
    super.initState();
    receitas = pegarReceitas(texto, deciso);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Resultado Pesquisa',
          style: GoogleFonts.italiana(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          child: FutureBuilder<List<ReceitaLista>>(
            future: receitas,
            builder:(context,snapshot) {
              if (snapshot.hasData) {
                if(snapshot.data!.length == 0){
                  return Center(child: Text("Não foi encontrada nenhuma receita."));
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    ReceitaLista receita = snapshot.data![index];
                    return Padding(
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
                            receita.nome!,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Rende para: ${receita.rendimento} pessoa(s)",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Wrap(
                            spacing: 15,
                            children: <Widget>[
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => receitaSolo(id: receita.id.toString())));
                                },
                                icon: Icon(Icons.remove_red_eye),
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Não foi encontrada nenhuma receita."));
              }
              return const CircularProgressIndicator();
            }
          ),
        ),
      ),
    );

  }
  Future<List<ReceitaLista>> pegarReceitas(String l, bool f) async {
    String teste;
    if(f == true){
      teste = "false";
    }else{
      teste = "true";
    }
    var url = await Uri.parse("http://192.168.0.103:3000/receitas");
    var resposta = await http.post(url,
      body: {
        "decisao": teste,
        "id": l,
      },
    );
    print(l);
     print(await resposta.statusCode);
    if (resposta.statusCode == 200) {
      List listaUsuarios = json.decode(resposta.body);
      print(listaUsuarios.length);
      return listaUsuarios.map((json) => ReceitaLista.fromJson(json))
          .toList();

    }
    throw Exception("Receitas não encontradas");
  }

}





