import 'package:flutter/material.dart';

class configuracoes extends StatelessWidget {
  const configuracoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0, 1),
              colors: <Color>[
                Color(0xffb00000),
                Color(0xffca0404),
                Color(0xffd20606),
                Color(0xffd80808),
                Color(0xffe60c0c),
                Color(0xffed0d0d),
                Color(0xffdd2921),
                Color(0xffbb5541),
                Color(0xffa86f53),
                Color(0xff968663),
                Color(0xff82a075),
                Color(0xff70b987),
                Color(0xff5ec18a),
                Color(0xff4ec88d),
                Color(0xff3cb97d),
                Color(0xff30af72),
              ], // Gradient from https://learnui.design/tools/gradient-generator.html              tileMode: TileMode.mirror,
            ),
          ),
          child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(120.0),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Container(margin: EdgeInsets.only(top: 20,left: 10),child: Text("Nome",style: TextStyle(color: Color(0xFF0047FF)),)),
                            Container(margin: EdgeInsets.only(left: 10,top: 5),child: Text("TesteUsuario")),
                            Divider(color: Colors.black,height: 1,),
                              Container(margin: EdgeInsets.only(top: 20,left: 10),child: Text("Email",style: TextStyle(color: Color(0xFF0047FF)),)),
                              Container(margin: EdgeInsets.only(left: 10,top: 5),child: Text("TesteUsuario@gmail.com",style: TextStyle(fontSize: 10),)),
                          ],),
                        )
                      ],
                    ),
                  Container(
                    width: 280,
                    height: 150,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(onPressed:(){},child: Row(children: [
                            Icon(Icons.question_mark,size: 40,),
                            Text("Sobre o aplicativo",style: TextStyle(fontSize: 25),)
                          ],)),
                              ElevatedButton(onPressed:(){},child: Row(children: [
                                Icon(Icons.power_settings_new,color: Colors.red,size: 40,),
                                Text("Sair da conta",style: TextStyle(fontSize: 25),)
                              ],)),
                        ],
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
