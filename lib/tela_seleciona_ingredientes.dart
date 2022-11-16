import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/Component/ButtonPages.dart';
import 'package:piattov2/cadastro_receita.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

class seleciona_ingrediente extends StatefulWidget {
  const seleciona_ingrediente({Key? key}) : super(key: key);

  @override
  _selecionaIngrediente createState() => new _selecionaIngrediente();
}

class _selecionaIngrediente extends State<seleciona_ingrediente> {
  final List<Map> data = List.generate(
      1, (index) => {'id': index, 'name': 'Item $index', 'isSelected': false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              }),
          backgroundColor: Colors.white,
          title: Text(
            'Selecionar ingredientes',
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
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 500,
                  width: 400,
                  child: Scaffold(
                    body: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: SafeArea(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return SizedBox(
                              width: 10,
                              height: 50,
                              child: MultiSelectContainer(
                                  itemsDecoration: MultiSelectDecorations(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          Colors.green.withOpacity(0.1),
                                          Colors.yellow.withOpacity(0.1),
                                        ]),
                                        border: Border.all(
                                            color: Colors.green[200]!),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    selectedDecoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 230, 126, 126),
                                          Color.fromARGB(255, 230, 126, 126)
                                        ],
                                      ),
                                      border: Border.all(
                                          color: Color.fromARGB(
                                              255, 230, 126, 126)),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    disabledDecoration: BoxDecoration(
                                      color: Colors.grey,
                                      border:
                                          Border.all(color: Colors.grey[500]!),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  items: [
                                    MultiSelectCard(
                                        value: 'Feijão', label: 'Feijão'),
                                    MultiSelectCard(
                                        value: 'Cenoura', label: 'Cenoura'),
                                    MultiSelectCard(
                                        value: 'Tomate', label: 'Tomate'),
                                    MultiSelectCard(
                                        value: 'Milho', label: 'Milho'),
                                    MultiSelectCard(
                                        value: 'Maionese', label: 'Maionese'),
                                    MultiSelectCard(
                                        value: 'Pepino', label: 'Pepino'),
                                    MultiSelectCard(
                                        value: 'Feijão', label: 'Feijão'),
                                    MultiSelectCard(
                                        value: 'Cenoura', label: 'Cenoura'),
                                    MultiSelectCard(
                                        value: 'Tomate', label: 'Tomate'),
                                    MultiSelectCard(
                                        value: 'Milho', label: 'Milho'),
                                    MultiSelectCard(
                                        value: 'Maionese', label: 'Maionese'),
                                    MultiSelectCard(
                                        value: 'Pepino', label: 'Pepino'),
                                    MultiSelectCard(
                                        value: 'Feijão', label: 'Feijão'),
                                    MultiSelectCard(
                                        value: 'Cenoura', label: 'Cenoura'),
                                    MultiSelectCard(
                                        value: 'Tomate', label: 'Tomate'),
                                    MultiSelectCard(
                                        value: 'Milho', label: 'Milho'),
                                    MultiSelectCard(
                                        value: 'Maionese', label: 'Maionese'),
                                    MultiSelectCard(
                                        value: 'Pepino', label: 'Pepino'),
                                    MultiSelectCard(
                                        value: 'Feijão', label: 'Feijão'),
                                    MultiSelectCard(
                                        value: 'Cenoura', label: 'Cenoura'),
                                    MultiSelectCard(
                                        value: 'Tomate', label: 'Tomate'),
                                    MultiSelectCard(
                                        value: 'Milho', label: 'Milho'),
                                    MultiSelectCard(
                                        value: 'Maionese', label: 'Maionese'),
                                    MultiSelectCard(
                                        value: 'Pepino', label: 'Pepino'),
                                  ],
                                  onChange:
                                      (allSelectedItems, selectedItem) {}),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 50,
                width: 470,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green.shade200),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => cadastroReceita()),
                    );
                  },
                  child: Text('Avançar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
