import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/tela_seleciona_ingredientes.dart';

class cadastroReceita extends StatelessWidget {
  const cadastroReceita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            child: TextField(
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
                              onPrimary: Colors.red.shade200,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Doce',
                              style: TextStyle(color: Colors.black),
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
                              onPrimary: Colors.red.shade200,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Salgado',
                              style: TextStyle(color: Colors.black),
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
                              onPrimary: Colors.green.shade200,
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
                          child: TextField(
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
                            const EdgeInsets.only(top: 80, left: 8, right: 8),
                        child: Container(
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.green.shade200),
                            ),
                            onPressed: () {},
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
    );
  }
}
