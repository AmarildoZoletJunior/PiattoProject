import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/account/tela_login.dart';
import 'package:piattov2/receita_solo.dart';
import 'package:piattov2/sobre.dart';

class configuracoes extends StatelessWidget {
  const configuracoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Configurações',
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
          padding: const EdgeInsets.only(top: 100.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('Image/icon.png'),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: FloatingActionButton(
                            autofocus: false,
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(color: Colors.transparent),
                            ),
                            onPressed: () {},
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "E-mail do Usuário",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
                Container(
                  height: 35,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Sobre()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.info,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Center(
                          child: Text(
                            'Sobre o Aplicativo',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 65,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey.shade400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 35,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => tela_login()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Center(
                          child: Text(
                            'Sair da Conta',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
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
}
