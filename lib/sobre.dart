import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Color(0xFF3A3737),
          leading: Container( margin:EdgeInsets.only(left: 5),child: IconButton(onPressed: (){}, icon: Icon(Icons.home,size: 50,))),
        ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                  Container(child: Text("Texto",style: TextStyle(fontSize: 20),)),
                Text("Versão 1.0.1",style: TextStyle(fontSize: 15),),
                    Divider(color: Colors.black),
                    Text("Sobre",style: TextStyle(fontSize: 20),),
                    Text("Aplicativo criado por alunos da universidade Católica de Santa Catarina",textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),
                    Divider(color: Colors.black),
                    Text("Desenvolvedores",style: TextStyle(fontSize: 20),),
                    Text("William Ronchi, Amarildo Junior, Nathalya Melchert, Vinicius da Cruz Muller, Alex Sander de Oliveira Barcelos",textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),
                  ],
                ),
              ),
              Container(width:180,height:250,child: Image(image: AssetImage("./Image/Planeta.png",))),
              Text("Seja consciente. Diga não ao desperdício de alimentos",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 30),)
            ],
          ),
        ),
      ),
    );
  }
}
