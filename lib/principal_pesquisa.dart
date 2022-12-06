import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/resultado_pesquisa.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'Component/ButtonPages.dart';
import 'model/ingrediente_model.dart';

class principalPesquisa extends StatefulWidget {
  @override
  _principalPesquisaState createState() => _principalPesquisaState();
}

class _principalPesquisaState extends State<principalPesquisa> {
  static List<ReceitaModel> receita_list = [
    ReceitaModel(
      'Arroz com Feijão',
      'Feijão',
    ),
  ];

  bool valor = true;
  var lista;
  List<ReceitaModel> display_list = List.from(receita_list);

  void updateList(String value) {
    setState(() {
      display_list = receita_list
          .where((element) => element.receita_ingredientes!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  final List<Map> data = List.generate(
      1, (index) => {'id': index, 'name': 'Item $index', 'isSelected': false});

  Color _favIconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    void open(String l,bool f){
      Navigator.of(context).push(MaterialPageRoute(builder:(context)=> resultadoPesquisa(text: l,decisao: f)));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Pesquisar Receita',
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
            Center(
              child: Container(
                height: 90,
                width: 450,
                child: Scaffold(
                  body: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
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
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.green.withOpacity(0.1),
                                            Colors.yellow.withOpacity(0.1),
                                          ],
                                        ),
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
                                  maxSelectableCount: 25,
                                  items: [
                                    MultiSelectCard(value: 1, label: 'Tomate'),
                                    MultiSelectCard(value: 2, label: 'Alho'),
                                    MultiSelectCard(value: 3, label: 'Cebola'),
                                    MultiSelectCard(
                                        value: 4, label: 'Cebolinha'),
                                    MultiSelectCard(
                                        value: 5, label: 'Gengibre'),
                                    MultiSelectCard(value: 6, label: 'Orégano'),
                                    MultiSelectCard(value: 7, label: 'Pimenta'),
                                    MultiSelectCard(
                                        value: 8, label: 'Mostarda'),
                                    MultiSelectCard(value: 9, label: 'Sal'),
                                    MultiSelectCard(
                                        value: 10, label: 'Farinha de Soja'),
                                  ],
                                  onChange: (allSelectedItems, selectedItem) {
                                    lista = allSelectedItems;
                                  }),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 120,
                width: 450,
                child: Scaffold(
                  body: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: SafeArea(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return SizedBox(
                              width: 10,
                              height: 10,
                              child: MultiSelectContainer(
                                  itemsDecoration: MultiSelectDecorations(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.green.withOpacity(0.1),
                                            Colors.yellow.withOpacity(0.1),
                                          ],
                                        ),
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
                                        value: 14, label: 'Farinha de Trigo'),
                                    MultiSelectCard(value: 15, label: 'Feijão'),
                                    MultiSelectCard(
                                        value: 16, label: 'Molho de Tomate'),
                                    MultiSelectCard(value: 18, label: 'Arroz'),
                                    MultiSelectCard(
                                        value: 19, label: 'Macarrão'),
                                    MultiSelectCard(
                                        value: 20, label: 'Carne de Boi'),
                                    MultiSelectCard(
                                        value: 21, label: 'Carne de Porco'),
                                  ],
                                  onChange: (allSelectedItems, selectedItem) {
                                    lista = allSelectedItems;
                                  }),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 100,
                width: 450,
                child: Scaffold(
                  body: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: SafeArea(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return SizedBox(
                              width: 10,
                              height: 10,
                              child: MultiSelectContainer(
                                  itemsDecoration: MultiSelectDecorations(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.green.withOpacity(0.1),
                                            Colors.yellow.withOpacity(0.1),
                                          ],
                                        ),
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
                                  maxSelectableCount: 25,
                                  items: [
                                    MultiSelectCard(
                                        value: 22, label: 'Carne de Frango'),
                                    MultiSelectCard(value: 23, label: 'Açucar'),
                                    MultiSelectCard(
                                        value: 24, label: 'Baunilha'),
                                    MultiSelectCard(value: 25, label: 'Canela'),
                                    MultiSelectCard(value: 26, label: 'Cravo'),
                                    MultiSelectCard(value: 27, label: 'Maçã'),
                                    MultiSelectCard(value: 28, label: 'Aveia'),
                                    MultiSelectCard(
                                        value: 29, label: 'Amendoim'),
                                    MultiSelectCard(
                                        value: 30, label: 'Chocolate Branco'),
                                    MultiSelectCard(
                                        value: 31, label: 'Chocolate Preto'),
                                    MultiSelectCard(value: 32, label: 'Cacau'),
                                  ],
                                  onChange: (allSelectedItems, selectedItem) {
                                    lista = allSelectedItems;
                                  }),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: ToggleSwitch(
                minWidth: 250,
                minHeight: 40.0,
                fontSize: 16.0,
                initialLabelIndex: 0,
                activeBgColor: [Colors.green.shade100],
                activeFgColor: Colors.black,
                inactiveBgColor: Colors.grey.shade200,
                inactiveFgColor: Colors.grey[900],
                totalSwitches: 2,
                labels: ['Contém', 'Exata'],
                onToggle: (index) {
                  if (index == 1) {
                    valor = false;
                  } else {
                    valor = true;
                  }
                  ;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 120, left: 8, right: 8),
                child: Container(
                  height: 50,
                  width: 450,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green.shade200),
                    ),
                    onPressed: () {
                      if (lista == null) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                                'Selecione pelo menos 1 ingrediente'),
                            content: const Text('Sua busca não é valida'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        var l = lista.join(",");
                        if (l.toString().length <= 0) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                  'Selecione pelo menos 1 ingrediente'),
                              content: const Text('Sua busca não é valida'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }else{
                          open(l,valor);
                        }
                      }
                    },
                    child: Text('Pesquisar Receitas'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
