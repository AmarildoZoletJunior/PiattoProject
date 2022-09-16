import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
            child: ListTile(
              title: Image(image: AssetImage("Image/PIATTO.png"),),
              subtitle: Text('Gareli'),
            ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 100,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),),
                onPressed: () {},
                child: Text("Editar", style: TextStyle(color: Colors.black),),
              ),
            ),
            Container(
              color: Colors.white,
              width: 100,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white),),
                onPressed: () {},
                child: Text("Excluir", style: TextStyle(color: Colors.black),),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
