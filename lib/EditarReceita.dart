import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/resultado_pesquisa.dart';
import 'package:piattov2/minhas_receitas.dart';
import 'package:piattov2/Component/ButtonPages.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'data/ReceitaSolo.dart';

class EditarReceita extends StatefulWidget {
  String titul,descri,rend,idRec;
  EditarReceita({Key? key,required this.titul,required this.descri,required this.rend,required this.idRec}) : super(key: key);
  @override
  State<EditarReceita> createState() => _EditarReceita(titul,descri,rend,idRec);
}

class _EditarReceita extends State<EditarReceita> {
  String tituloVindo,descricaoVindo,rendimentoVindo,idR;
  _EditarReceita(this.tituloVindo,this.descricaoVindo,this.rendimentoVindo,this.idR);
  final List<Map> data = List.generate(
      1, (index) => {'id': index, 'name': 'Item $index', 'isSelected': false});

  bool valor = true;
  var lista;


  List<String> tempArray = [];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final titulo = TextEditingController();
    final descricao = TextEditingController();
    final rendimento = TextEditingController();
    titulo.text = tituloVindo.toString();
    descricao.text = descricaoVindo.toString();
    rendimento.text = rendimentoVindo.toString();
    return Scaffold(
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
          'Modificar Receita',
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
        padding: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 10),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Titulo',
                  style: GoogleFonts.italiana(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(5, 6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: TextFormField(
                        controller: titulo,
                        validator: (value) {
                          if (value!.length < 3) {
                            return "Informe o nome da receita!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabled: true,
                          hintText: "Nome da Receita",
                          hintStyle: TextStyle(fontWeight: FontWeight.normal),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Rendimento',
                  style: GoogleFonts.italiana(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(5, 6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: TextFormField(
                        controller: rendimento,
                        validator: (value) {
                          RegExp exp = RegExp(r'^[0-9]+$');
                          if (value!.isEmpty || !exp.hasMatch(value.toString())) {
                            return "Informe o rendimento da receita!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          enabled: true,
                          hintText: "Rendimento",
                          hintStyle: TextStyle(fontWeight: FontWeight.normal),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Modo de preparo',
                  style: GoogleFonts.italiana(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(5, 6),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: TextFormField(
                      controller: descricao,
                      validator: (value) {
                        if (value!.length < 3) {
                          return "Informe o modo de preparo da receita!";
                        }
                        return null;
                      },
                      maxLines: 15,
                      decoration: InputDecoration(
                        enabled: true,
                        hintText: 'Modo de preparo',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100, left: 8, right: 8),
                    child: Container(
                      height: 50,
                      width: 500,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green.shade200),
                        ),
                        onPressed: () async {
                          if(_formKey.currentState!.validate()){
                            var resultadoEdit = EditarRec(titulo.value.text.toString(),descricao.value.text.toString(),rendimento.value.text.toString(),idR);

                              open();

                            }
                          },
                        child: Text('Registrar Receita'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<int> EditarRec(String titulo,String descricao,String rendimento,String IdReceita) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = await Uri.parse("http://192.168.0.103:3000/receitasCriadas");
    var resposta = await http.put(url,
      body: {
        "idReceita": IdReceita,
        "nome": titulo,
        "preparo":descricao,
        "rendimento":rendimento
      },
    );
    print(resposta.statusCode);
    if(resposta.statusCode == 200){
   print("OK");
    }
    return resposta.statusCode;
  }
void open() {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MainPage()));
}
}
