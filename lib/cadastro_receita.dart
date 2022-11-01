import 'package:flutter/material.dart';

class cadastroReceita extends StatelessWidget {
  const cadastroReceita({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          backgroundColor: Colors.black12,
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
                              child: TextField(
                                decoration: InputDecoration(
                                  enabled: true,
                                  hintText: "Nome da Receita",
                                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none
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
                              onPressed: () {},
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
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 100.0, left: 8, right: 8),
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
    );
  }
}
