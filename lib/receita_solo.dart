import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/principal_pesquisa.dart';
import 'model/ingrediente_model.dart';

class receitaSolo extends StatelessWidget {
  const receitaSolo({Key? key}) : super(key: key);

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
                MaterialPageRoute(builder: (context) => principalPesquisa()),
              );
            },
          ),
          title: Text(
            'Voltar',
            style: GoogleFonts.italiana(
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                width: 250,
                height: 400,
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
                    Container(
                      child: Text(
                        "Arroz com Feijão",
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
                      height: 5,
                    ),
                    Text(
                      "Nível: Médio",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 15,
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
                    Text(
                      "....",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 10,
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
                      "Pegar os ingredientes e blablablablabla...",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      height: 35,
                      width: 57,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_border_outlined,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(0, 235, 128, 128),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
