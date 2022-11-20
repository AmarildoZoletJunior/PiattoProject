import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/account/tela_login.dart';

class tela_cadastro extends StatefulWidget {
  @override
  _tela_cadastroState createState() => _tela_cadastroState();
}

class _tela_cadastroState extends State<tela_cadastro> {
  final emailController = TextEditingController();
  String password = '';
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();

    emailController.addListener(() => setState(() {}));
  }

  late FocusNode focusNode1 = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  late FocusNode focusNode2 = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  late FocusNode focusNode3 = FocusNode()
    ..addListener(() {
      setState(() {});
    });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                height: 100,
                child: Center(
                  child: Text(
                    'PIATTO',
                    style: GoogleFonts.italiana(
                      textStyle: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 350,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextField(
                        focusNode: focusNode1,
                        controller: emailController,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "name@example.com",
                          labelText: 'Email',
                          floatingLabelStyle: const TextStyle(
                              color: Color.fromRGBO(200, 230, 201, 1)),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: focusNode1.hasFocus
                                ? Color.fromRGBO(200, 230, 201, 1)
                                : Colors.grey,
                          ),
                          suffixIcon: emailController.text.isEmpty
                              ? Container(width: 0)
                              : IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () => emailController.clear(),
                                ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(200, 230, 201, 1),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextField(
                        focusNode: focusNode2,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "******",
                          labelText: 'Senha',
                          floatingLabelStyle: const TextStyle(
                              color: Color.fromRGBO(200, 230, 201, 1)),
                          prefixIcon: Icon(
                            Icons.https,
                            color: focusNode2.hasFocus
                                ? Color.fromRGBO(200, 230, 201, 1)
                                : Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: isPasswordVisible
                                ? Icon(
                                    Icons.visibility_off,
                                    color: focusNode2.hasFocus
                                        ? Color.fromRGBO(200, 230, 201, 1)
                                        : Colors.grey,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: focusNode2.hasFocus
                                        ? Color.fromRGBO(200, 230, 201, 1)
                                        : Colors.grey,
                                  ),
                            onPressed: () => setState(
                                () => isPasswordVisible = !isPasswordVisible),
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(200, 230, 201, 1),
                            ),
                          ),
                        ),
                        obscureText: isPasswordVisible,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: TextField(
                        focusNode: focusNode3,
                        cursorColor: Colors.black,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "******",
                          labelText: 'Confirmar senha',
                          floatingLabelStyle: const TextStyle(
                              color: Color.fromRGBO(200, 230, 201, 1)),
                          prefixIcon: Icon(
                            Icons.https,
                            color: focusNode3.hasFocus
                                ? Color.fromRGBO(200, 230, 201, 1)
                                : Colors.grey,
                          ),
                          suffixIcon: IconButton(
                            icon: isPasswordVisible
                                ? Icon(
                                    Icons.visibility_off,
                                    color: focusNode3.hasFocus
                                        ? Color.fromRGBO(200, 230, 201, 1)
                                        : Colors.grey,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: focusNode3.hasFocus
                                        ? Color.fromRGBO(200, 230, 201, 1)
                                        : Colors.grey,
                                  ),
                            onPressed: () => setState(
                                () => isPasswordVisible = !isPasswordVisible),
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(200, 230, 201, 1),
                            ),
                          ),
                        ),
                        obscureText: isPasswordVisible,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: SizedBox(
                  height: 30,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => tela_login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text('Cadastrar'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
