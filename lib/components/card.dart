import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.white,
      child: ListTile(
        title: Image(image: AssetImage("Image/PIATTO.png"),
        ),
        subtitle: Text('Gareli'),
        trailing: Container(
          child: TextButton(
            onPressed: () {},
            child: Text("Clicou"),
          ),
        ),
      ),
    );
  }
}
