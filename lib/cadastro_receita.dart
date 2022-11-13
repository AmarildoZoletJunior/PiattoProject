import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:google_fonts/google_fonts.dart';

class cadastroReceita extends StatefulWidget {
  const cadastroReceita({Key? key}) : super(key: key);

  @override
  _cadastroReceita createState() => new _cadastroReceita();
}

class _cadastroReceita extends State<cadastroReceita> {
  final List<Map> data = List.generate(
      1, (index) => {'id': index, 'name': 'Item $index', 'isSelected': false});

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
          body: Container(
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
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Selecionar Ingredientes',
                        style: GoogleFonts.italiana(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: 300,
                              width: 400,
                              child: Scaffold(
                                backgroundColor: Colors.transparent,
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
                                              itemsDecoration:
                                                  MultiSelectDecorations(
                                                decoration: BoxDecoration(
                                                    gradient:
                                                        LinearGradient(colors: [
                                                      Colors.green
                                                          .withOpacity(0.1),
                                                      Colors.yellow
                                                          .withOpacity(0.1),
                                                    ]),
                                                    border: Border.all(
                                                        color:
                                                            Colors.green[200]!),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                selectedDecoration:
                                                    BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    colors: [
                                                      Colors.red,
                                                      Colors.redAccent
                                                    ],
                                                  ),
                                                  border: Border.all(
                                                      color: Colors.red[700]!),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                disabledDecoration:
                                                    BoxDecoration(
                                                  color: Colors.grey,
                                                  border: Border.all(
                                                      color: Colors.grey[500]!),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              items: [
                                                MultiSelectCard(
                                                    value: 'Dart',
                                                    label: 'Feijão'),
                                                MultiSelectCard(
                                                    value: 'Python',
                                                    label: 'Python'),
                                                MultiSelectCard(
                                                    value: 'JavaScript',
                                                    label: 'JavaScript'),
                                                MultiSelectCard(
                                                    value: 'Java',
                                                    label: 'Java'),
                                                MultiSelectCard(
                                                    value: 'C#', label: 'C#'),
                                                MultiSelectCard(
                                                    value: 'C++', label: 'C++'),
                                              ],
                                              onChange: (allSelectedItems,
                                                  selectedItem) {}),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
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
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30, left: 10, right: 10),
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
    );
  }
}
