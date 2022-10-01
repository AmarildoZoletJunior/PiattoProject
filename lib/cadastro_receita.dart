import 'package:flutter/material.dart';

class cadastro_receita extends StatelessWidget {
  const cadastro_receita({Key? key}) : super(key: key);

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
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  height: 620,
                  width: 400,
                  child: Container(
                    child: ListView(
                      padding: const EdgeInsets.all(8),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                foregroundColor: MaterialStateProperty.all(
                                    Colors.red.shade300),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Icon(Icons.add),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                overlayColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              onPressed: () {},
                              child: Text('Doce'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 40,
                            width: 40,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                overlayColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              onPressed: () {},
                              child: Text('Salgado'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Center(
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.grey,
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'Nome da Receita',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Center(
                              child: Container(
                                height: 100,
                                child: TextField(
                                  maxLines: 15,
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey,
                                    filled: true,
                                    border: InputBorder.none,
                                    hintText: 'Descrição',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
