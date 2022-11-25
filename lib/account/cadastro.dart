import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/account/tela_login.dart';
import 'package:email_validator/email_validator.dart';
import "package:http/http.dart" as http;

class tela_cadastro extends StatefulWidget {
  @override
  _tela_cadastroState createState() => _tela_cadastroState();
}

class _tela_cadastroState extends State<tela_cadastro> {
  final emailController = TextEditingController();
  String password = '';
  bool isPasswordVisible = false;
  final email = TextEditingController();
final senha = TextEditingController();
  final confirmarsenha = TextEditingController();
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
  final _formKey = GlobalKey<FormState>();
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
                child: Form(
                  key:_formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                          validator: (value) {
                            final bool isValid = EmailValidator.validate(value!);
                            if (value == null || value.isEmpty || !isValid) {
                              return 'Coloque um email válido';
                            }
                            return null;
                          },
                          focusNode: focusNode1,
                          controller: email,
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 3) {
                              return 'senha indisponivel';
                            }

                            return null;
                          },
                          controller: senha,
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
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty || value != senha.value.text) {
                              return 'senha incorreta';
                            }
                            return null;
                          },
                          controller: confirmarsenha,
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
              ),
              Container(
                child: SizedBox(
                  height: 30,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {


                         int status = await login(email.value.text,senha.value.text,confirmarsenha.value.text);
                        if(status == 200){
                          login(email.value.text,senha.value.text,confirmarsenha.value.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => tela_login()),
                          );
                        }else if(status == 401){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Email ja cadastrado'),
                              content: const Text('Por favor insira outro email'),
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

Future<int> login(String email, String senha,String confirmarsenha) async{
  var url = await Uri.parse("http://192.168.0.103:3000/Criarusuario");
  var resposta = await http.post(url,
  body: {
    "email": email,
    "senha": senha,
    "confirmarsenha": confirmarsenha
  },
  );
  return resposta.statusCode;
}
