import "package:flutter/material.dart";
import 'package:piattov2/account/tela_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../principal_pesquisa.dart';

class Stela_principal extends StatefulWidget {
  const Stela_principal({Key? key}) : super(key: key);


  @override
  tela_principal createState() => tela_principal();
}
class tela_principal extends State<Stela_principal>{
  void initState() {
    super.initState();
    verificarToken().then((value) {
      if (value) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context)=> principalPesquisa()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context)=> tela_login()));
      }
    });
  }
  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
              top: -220,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Image(
                  image: AssetImage("Image/PIATTO.png"),
                ),
              ),
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
              top: -490,
              left: -250,
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> verificarToken() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  if(sharedPreferences.getInt("id") != null){
    return true;
  }else{
    return false;
  }
}