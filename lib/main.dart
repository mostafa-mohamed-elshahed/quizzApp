import 'package:flutter/material.dart';
import 'package:trueandfalse/pages/LandingPage.dart';

main(){
  runApp(TrueAndFalse());
}

class TrueAndFalse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage()
    );
  }
}
