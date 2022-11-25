import 'dart:html';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piattov2/account/tela_login.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
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
          ],
        ),
        nextScreen: tela_login(),
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: Duration(seconds: 1),
    );
  }
}
