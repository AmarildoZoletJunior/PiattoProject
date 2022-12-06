import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/ReceitaLista.dart';
import 'model/ingrediente_model.dart';
import "package:http/http.dart" as http;


class favoritoPage extends StatefulWidget {
  const favoritoPage({Key? key}) : super(key: key);

  @override
  State<favoritoPage> createState() => _favoritoPageState();
}

class _favoritoPageState extends State<favoritoPage> {
  static List<ReceitaModel> receita_list = [
    ReceitaModel(
      'Arroz com Feijão',
      'Feijão',
    ),
  ];

  List<ReceitaModel> display_list = List.from(receita_list);
  late Future<List<ReceitaLista>> receitas;
  Color _favIconColor = Colors.red;
  @override
  void initState() {
    super.initState();
    receitas = Favoritos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Favoritos',
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
            Expanded(
              child: FutureBuilder<List<ReceitaLista>>(
                future: receitas,
    builder:(context,snapshot) {
      if (snapshot.hasData) {
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
              "Rendimento para ${receita.rendimento!} Pessoa{s}",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: _favIconColor,
              ),
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Deseja excluir esta receita dos favoritos?'),
                    content: const Text('Ela pode um dia fazer falta'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancelar'),
                        child: const Text('Cancelar'),
                      ),
                      TextButton(
                        onPressed: () {
                          var resultado = deletarFavorito(receita.id.toString());
                          Navigator.pop(context, 'Ok');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => favoritoPage()),
                          );
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
               );
              },
            ),
          ),
        ),
      );
    }
        );
    } else if (snapshot.hasError) {
        return Center(child: Text("Não foi encontrada nenhuma receita nos favoritos."));
      }
      return Center(child: const CircularProgressIndicator());
    }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<ReceitaLista>> Favoritos() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = await Uri.parse("http://192.168.0.103:3000/favoritos/2");
  var resposta = await http.get(url);
  if(resposta.statusCode == 200){
    print(resposta.statusCode);
    List listaUsuarios = json.decode(resposta.body);
    return listaUsuarios.map((json) => ReceitaLista.fromJson(json))
        .toList();
  }
  throw Exception("Falha em carregar receitas");
}

Future<int> deletarFavorito(String id) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = await Uri.parse("http://192.168.0.103:3000/favoritos/2");
  var resposta = await http.delete(url,
    body: {
      "id": id,
    },
  );
  print(resposta.statusCode);
  return resposta.statusCode;
}

Future<int> AdicionarFavoritos(String id) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = await Uri.parse("http://192.168.0.103:3000/favoritos/2");
  var resposta = await http.post(url,
    body: {
      "id": id,
    },
  );
  print(resposta.statusCode);
  return resposta.statusCode;
}