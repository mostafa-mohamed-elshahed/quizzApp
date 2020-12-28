import 'package:flutter/material.dart';
import 'package:trueandfalse/pages/LandingPage.dart';

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Score: ",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
          ),
          Text(score.toString() + "/" + totalQuestions.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50)),
          IconButton(
              icon: Icon(Icons.arrow_right),
              color: Colors.white,
              iconSize: 50,
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LandingPage()),
                  (Route route) => route == null))
        ],
      ),
    );
  }
}
