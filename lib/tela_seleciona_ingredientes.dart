import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/cadastro_receita.dart';

class seleciona_ingrediente extends StatefulWidget {
  const seleciona_ingrediente({Key? key}) : super(key: key);

  @override
  _selecionaIngrediente createState() => new _selecionaIngrediente();
}

class _selecionaIngrediente extends State<seleciona_ingrediente> {
  final List<Map> data = List.generate(100,
      (index) => {'id': index, 'name': 'Item $index', 'isSelected': false});

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
                  MaterialPageRoute(builder: (context) => cadastroReceita()),
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
          child: Center(
            child: Container(
              height: 620,
              width: 400,
              child: Scaffold(
                body: SafeArea(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                        key: ValueKey(data[index]['name']),
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: data[index]['isSelected'] == true
                            ? Colors.green.shade500
                            : Colors.grey,
                        child: ListTile(
                          onTap: () {
                            setState(
                              () {
                                data[index]['isSelected'] =
                                    !data[index]['isSelected'];
                              },
                            );
                          },
                        ),
                      );
                    },
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
