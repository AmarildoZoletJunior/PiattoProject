import 'package:flutter/material.dart';
import 'components/card.dart';

class minhas_receitas extends StatelessWidget {
  const minhas_receitas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 1,
        child: Scaffold(
          body: SafeArea(
            child: Container(
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
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: 650,
                  width: 400,
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Minhas Receitas",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Italiana",
                          fontSize: 60,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10, top: 20),
                      height: 450,
                      width: 300,
                      child: Container(
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (ctx, i) => card(),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
