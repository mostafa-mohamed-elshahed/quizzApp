import 'package:flutter/material.dart';
import 'package:trueandfalse/Ui/AnswerButton.dart';
import 'package:trueandfalse/Ui/questionText.dart';
import 'package:trueandfalse/Ui/correctWrongAnswer.dart';
import 'package:trueandfalse/pages/CustomQuiz.dart';
import 'package:trueandfalse/pages/ScorePage.dart';
import 'package:trueandfalse/questions/Question.dart';
import 'package:trueandfalse/questions/quiz.dart';
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz=CustomQuiz();

  // ignore: non_constant_identifier_names

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible= false;

  @override
  void initState(){
    super.initState();
    currentQuestion =quiz.nextQuestion;
    questionText =currentQuestion.question;
    questionNumber =quiz.questionNumber;
  }
  void handleAnswer(bool answer){
    isCorrect =(currentQuestion.answer==answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible =true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            AnswerButton(true, ()=> handleAnswer(true)),
            QuestionText(questionText,questionNumber),
            AnswerButton(false, ()=> handleAnswer(false)),
          ],
        ),
        overlayShouldBeVisible == true ? CorrectWrongOverlay(

          isCorrect,(){
          if(quiz.length== questionNumber) {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context)=>ScorePage(
              quiz.score , quiz.length,)),(Route route) =>route == null);
            return ;
          }
            currentQuestion= quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible =false;
              questionText =currentQuestion.question;
              questionNumber=quiz.questionNumber;
            });
        }
        ) :Container()
      ],
    );
  }
}
