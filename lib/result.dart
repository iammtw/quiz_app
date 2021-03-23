import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetQuiz;
  Result(this.score, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if (score <= 10) {
      resultText = "You are Low Standard!";
    } else if (score <= 20) {
      resultText = "You are Pretty Likeable!";
    } else if (score <= 30) {
      resultText = "You are Clean!";
    } else if (score <= 40) {
      resultText = "You are Awesome and Innocent!";
    } else {
      resultText = "You are Higher!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          RaisedButton(
            child: Icon(Icons.autorenew_outlined),
            color: Colors.deepPurple,
            onPressed: resetQuiz,
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}
