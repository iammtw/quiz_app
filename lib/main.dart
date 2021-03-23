import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Who\'s your favourite actor?',
      'answers': [
        {'text': 'Sharukh Khan', 'score': 10},
        {'text': 'Salman Khan', 'score': 7},
        {'text': 'Amir Khan', 'score': 4},
        {'text': 'Emraan Hashmi', 'score': 1},
      ]
    },
    {
      'questionText': 'Who\'s your favourite actress?',
      'answers': [
        {'text': 'Katrina Kaif', 'score': 10},
        {'text': 'Deepika Paudkone', 'score': 7},
        {'text': 'Priyanka Chopra', 'score': 4},
        {'text': 'Disha Patani', 'score': 1},
      ]
    },
    {
      'questionText': 'Who\'s your favourite Male Singer?',
      'answers': [
        {'text': 'Arijit Singh', 'score': 10},
        {'text': 'Rahat Fateh Ali Khan', 'score': 7},
        {'text': 'Atif Aslam', 'score': 4},
        {'text': 'Jubin Nutiyal', 'score': 1},
      ]
    },
    {
      'questionText': 'Who\'s your favourite Female Singer?',
      'answers': [
        {'text': 'Sherya Ghoshal', 'score': 10},
        {'text': 'Aima Baig', 'score': 7},
        {'text': 'Palak Muchal', 'score': 4},
        {'text': 'Sundhi Chahun', 'score': 1},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totaScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totaScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totaScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Personal Quiz"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: (_questionIndex < _questions.length)
                    ? Quiz(
                        questions: _questions,
                        answerQuestion: _answerQuestion,
                        questionIndex: _questionIndex,
                      )
                    : Result(_totaScore, _resetQuiz),
              ),
            ],
          )),
    );
  }
}
