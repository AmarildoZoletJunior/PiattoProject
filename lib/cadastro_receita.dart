import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/Component/ButtonPages.dart';
import 'package:piattov2/minhas_receitas.dart';
import 'package:piattov2/tela_seleciona_ingredientes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;

class cadastroReceita extends StatelessWidget {
  const cadastroReceita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titulo = TextEditingController();
    final descricao = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Cadastrar Receita',
              style: GoogleFonts.italiana(
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Container(
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
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
                                  if (value!.length > 3) {
                                    return "Você precisa digitar um titulo para a receita";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  enabled: true,
                                  hintText: "Nome da Receita",
                                  hintStyle:
                                  TextStyle(fontWeight: FontWeight.normal),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.black,
                                elevation: 5,
                                primary: Colors.white,
                                onPrimary: Colors.green.shade400,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          seleciona_ingrediente()),
                                );
                              },
                              child: Text(
                                'Selecionar Ingredientes',
                                style: TextStyle(color: Colors.black),
                              ),
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
                                if (value!.length > 3) {
                                  return "Você precisa digitar o passo a passo da receita abaixo";
                                }
                                return null;
                              },
                              maxLines: 15,
                              decoration: InputDecoration(
                                enabled: true,
                                hintText: 'Descrição',
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
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 200, left: 8, right: 8),
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green.shade200),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {

                                }
                              },
                              child: Text('Publicar Receita'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/*  Future<int> Cadastro(String titulo, String descricao) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = await Uri.parse("http://192.168.0.103:3000/ReceitasCriadas/");
    var resposta = await http.post(url,
      body: {
        "email": ,
        "senha": ,
      },
    );
    print(resposta.statusCode);*/
//     print(sharedPreferences.getInt("id"));
//     if(resposta.statusCode == 200){
//
//       await sharedPreferences.setInt("id", jsonDecode(resposta.body));
//     }
//     return resposta.statusCode;
//   }
//
// }

