import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class minhasReceitas extends StatelessWidget {
  const minhasReceitas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Minhas Receitas',
          style: GoogleFonts.italiana(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),),
    );
  }
}
