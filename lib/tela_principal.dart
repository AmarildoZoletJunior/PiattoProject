import "package:flutter/material.dart";


class tela_principal extends StatelessWidget {
  const tela_principal({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Stack(
              children: [
                Positioned(child: Container(
                  width: 500.0,
                  height: 1500,
                  color: Color(0xff01C667),
                ),            ),
                Positioned(child: Container(
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
                    child: Center(child:Image(image: AssetImage("Image/PIATTO.png"),),)),
                Positioned(child: Container(
                  width: 900.0,
                  height: 800.0,
                  decoration: new BoxDecoration(
                    color: Color(0xffC10303),
                    shape: BoxShape.circle,
                  ),
                ),
                  top: -490,
                  left: -250,),
              ],
            )
        )
    );
  }
}