import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;
import 'data/ReceitaLista.dart';
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
  late Future<List<ReceitaLista>>? receitas;
  @override
  void initState() {
    super.initState();
    receitas = ListarReceitas();
  }
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
    "Renda para ${receita.rendimento!} pessoas",
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
    onPressed: () {
    showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
    title: const Text('Deseja excluir esta receita?'),
    content: const Text('Ela é tão deliciosa :/'),
    actions: <Widget>[
    TextButton(
    onPressed: () => Navigator.pop(context, 'Cancelar'),
    child: const Text('Cancelar'),
    ),
    TextButton(
    onPressed: () {
      var resultado = DeletarReceita(receita.id.toString());
      Navigator.pop(context, 'Ok');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => minhasReceitas()),
      );
    },
    child: const Text('OK'),
    ),
    ],
    ),
    );
    },
    icon: Icon(Icons.delete_rounded),
    color: Colors.black,
    ),
    ],
    ),
    ),
    ),
    );
    });
    }else if (snapshot.hasError) {
      return Center(child: Text("Não foi encontrada nenhuma receita nos favoritos."));
      }
          return Center(child: const CircularProgressIndicator());})
      ),
    );
  }
}
Future<List<ReceitaLista>> ListarReceitas() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = await Uri.parse("http://192.168.0.103:3000/receitasCriadas/1");
  var resposta = await http.get(url);
  if(resposta.statusCode == 200){
    print(resposta.statusCode);
    List listaUsuarios = json.decode(resposta.body);
    return listaUsuarios.map((json) => ReceitaLista.fromJson(json))
        .toList();
  }
  throw Exception("Falha em carregar receitas");
}
Future<int> DeletarReceita(String id) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = await Uri.parse("http://192.168.0.103:3000/receitasCriadas");
  var resposta = await http.delete(url,
    body: {
      "idReceita": id,
    },
  );
  print(resposta.statusCode);
  return resposta.statusCode;
}


