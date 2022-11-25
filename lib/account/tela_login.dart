import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/Component/ButtonPages.dart';
import 'package:piattov2/account/cadastro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;

import '../principal_pesquisa.dart';

class tela_login extends StatefulWidget {
  @override
  _tela_loginState createState() => _tela_loginState();
}

class _tela_loginState extends State<tela_login> {
  final emailController = TextEditingController();
  String password = '';
  bool isPasswordVisible = false;
  final email = TextEditingController();
  final senha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                  height: 180,
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            focusNode: focusNode1,
                            controller: email,
                            validator: (value) {
                              final bool isValid = EmailValidator.validate(value!);
                              if (value == null || value.isEmpty || value.length < 3 || !isValid) {
                                return 'Email vazio/incorreto';
                              }

                              return null;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "usuario@email.com",
                              labelText: 'E-mail',
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
                          margin: EdgeInsets.only(bottom: 30),
                          child: TextFormField(
                            controller: senha,
                            validator: (value) {
                              if (value == null || value.isEmpty || value.length < 3) {
                                return 'Senha não pode ser vazia';
                              }

                              return null;
                            },
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
                                onPressed: () =>
                                    setState(
                                            () =>
                                        isPasswordVisible = !isPasswordVisible),
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
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        child: SizedBox(
                          height: 30,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate())  {
                            int status = await login(email.value.text,senha.value.text);
                            if(status == 200){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => principalPesquisa()),
                              );
                            }else if(status == 400){
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Email ou senha incorreta'),
                                  content: const Text('Por favor insira outro email/senha'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            child: Text('Entrar'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: SizedBox(
                          height: 30,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => tela_cadastro()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ), child: Text('Cadastrar'),
                          ),
                        ),
                      )
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


Future<int> login(String email, String senha) async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var url = await Uri.parse("http://192.168.0.103:3000/usuario");
  var resposta = await http.post(url,
    body: {
      "email": email,
      "senha": senha,
    },
  );
  print(resposta.statusCode);
  if(resposta.statusCode == 200){
  await sharedPreferences.setInt("id", jsonDecode(resposta.body));
  }
  return resposta.statusCode;
}