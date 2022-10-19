import 'package:flutter/material.dart';
import 'package:piattov2/account/cadastro.dart';
import 'package:piattov2/account/tela_principal.dart';

class tela_login extends StatelessWidget {
  const tela_login({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              child: Container(
                width: 500.0,
                height: 1500,
                color: Color(0xff01C667),
              ),
            ),
            Positioned(
              child: Container(
                width: 900.0,
                height: 800.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              left: -250,
              top: -300,
            ),
            Positioned(
              child: Container(
                width: 900.0,
                height: 800.0,
                decoration: new BoxDecoration(
                  color: Color(0xffC10303),
                  shape: BoxShape.circle,
                ),
              ),
              top: -480,
              left: -250,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10, top: 50),
                    width: 360,
                    height: 200,
                    child: Image(
                      image: AssetImage("Image/PIATTO.png"),
                    ),
                  ),
                  Container(
                    width: 330,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextField(
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              hintText: "Email",
                              filled: true,
                              fillColor: Color(0xff787878),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: TextField(
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                hintText: "Senha",
                                filled: true,
                                fillColor: Color(0xff787878),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          child: SizedBox(
                            height: 40,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const tela_principal()),
                                );
                                // Respond to button press
                              },
                              child: Text('Entrar'),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 40,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const tela_cadastro()),
                                );
                              },
                              child: Text('Cadastrar'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
