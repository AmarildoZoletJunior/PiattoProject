import 'package:flutter/material.dart';
import 'package:piattov2/tela_seleciona_ingredientes.dart';

class cadastro_receita extends StatefulWidget {
  const cadastro_receita({Key? key}) : super(key: key);

  @override
  _cadastroReceitaState createState() => _cadastroReceitaState();
}

class _cadastroReceitaState extends State<cadastro_receita> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0, 1),
                  colors: <Color>[
                    Color(0xffb00000),
                    Color(0xffca0404),
                    Color(0xffd20606),
                    Color(0xffd80808),
                    Color(0xffe60c0c),
                    Color(0xffed0d0d),
                    Color(0xffdd2921),
                    Color(0xffbb5541),
                    Color(0xffa86f53),
                    Color(0xff968663),
                    Color(0xff82a075),
                    Color(0xff70b987),
                    Color(0xff5ec18a),
                    Color(0xff4ec88d),
                    Color(0xff3cb97d),
                    Color(0xff30af72),
                  ], // Gradient from https://learnui.design/tools/gradient-generator.html              tileMode: TileMode.mirror,
                ),
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  height: 620,
                  width: 400,
                  child: Container(
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Container(
                              child: TextField(
                                decoration: InputDecoration(
                                  enabled: true,
                                  hintText: "Nome da Receita",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
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
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                overlayColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              onPressed: () {},
                              child: Text('Doce'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                overlayColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              onPressed: () {},
                              child: Text('Salgado'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => seleciona_ingrediente()),
                                );
                              },
                              child: Text('Selecionar Ingredientes'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 200,
                                child: TextField(
                                  maxLines: 15,
                                  decoration: InputDecoration(
                                    enabled: true,
                                    hintText: 'Descrição',
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                      ),

                                  ),
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 90.0, left: 8, right: 8),
                          child: Container(
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                overlayColor:
                                    MaterialStateProperty.all(Colors.green),
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
      ),
    );
  }
}
