import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/Component/ButtonPages.dart';
import 'package:piattov2/principal_pesquisa.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/ReceitaSolo.dart';
import "package:http/http.dart" as http;
import 'model/ingrediente_model.dart';
import 'dart:convert';

class receitaSolo extends StatefulWidget {
 String id;

  receitaSolo({Key? key,required this.id}) : super(key: key);

  @override
  State<receitaSolo> createState() => _receitaSoloState(this.id);
}

class _receitaSoloState extends State<receitaSolo> {
  String id;
  _receitaSoloState(this.id);
  Color _favIconColor = Colors.black;
  late Future<ReceitaSolo> receita;
  @override
  void initState() {
    super.initState();
    receita = pegarReceitas(int.parse(id));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
          ),
          title: Text(
            'Receita',
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
    child: FutureBuilder<ReceitaSolo>(
    future: receita,
    builder:(context,snapshot) {
    if(snapshot.hasData){
      if(snapshot.data == null){
        return Center(child: Text("Não foi encontrada nenhuma receita."));
      }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
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
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  child: Text(
                                    snapshot.data!.nome.toString(),
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 35,
                                  width: 57,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: _favIconColor,
                                    ),
                                    onPressed: () {
                                      setState(
                                        () {
                                          if (_favIconColor == Colors.black) {
                                            AdicionarFavoritos(snapshot.data!.receitaId.toString());
                                            _favIconColor = Colors.red;
                                          } else {
                                            deletarFavorito(snapshot.data!.receitaId.toString());
                                            _favIconColor = Colors.black;
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Rendimento",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${snapshot.data!.rendimento.toString()} porção(es)",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Ingredientes",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              snapshot.data!.ingredientes.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [
                                            Colors.white,
                                            Colors.black
                                          ],
                                              begin: Alignment.centerRight,
                                              end: Alignment.centerLeft)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2),
                                  child: Row(
                                    children: [
                                      Icon(Icons.restaurant),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [
                                            Colors.white,
                                            Colors.black
                                          ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Modo de Preparo",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                snapshot.data!.descricao.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
  }else if(snapshot.hasError){
      return Center(child: Text("Não foi encontrada nenhuma receita."));
    }
    return const CircularProgressIndicator();
}
))
          ),
        );
  }
  Future<ReceitaSolo> pegarReceitas(int id) async {
    var url = await Uri.parse("http://192.168.0.103:3000/receita/" + id.toString());
    var resposta = await http.get(url);
    print(await resposta.statusCode);
    if (resposta.statusCode == 200) {
      var listaUsuarios = json.decode(resposta.body);
      return ReceitaSolo.fromJson(listaUsuarios);
    }
    throw Exception("Receitas não encontradas");
  }
  Future<int> deletarFavorito(String id) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = await Uri.parse("http://192.168.0.103:3000/favoritos/"  + sharedPreferences.getString("id").toString());
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
    var url = await Uri.parse("http://192.168.0.103:3000/favoritos/" + sharedPreferences.getString("id").toString());
    var resposta = await http.post(url,
      body: {
        "id": id,
      },
    );
    print(resposta.statusCode);
    return resposta.statusCode;
  }
}
