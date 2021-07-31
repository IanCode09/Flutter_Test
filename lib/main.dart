import 'package:flutter/material.dart';
import './Question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

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
      'questionText': 'What\'s your favorite hero',
      'answers': [
        {'text': 'Chou', 'score': 20},
        {'text': 'Thamuz', 'score': 30},
        {'text': 'Granger', 'score': 10},
        {'text': 'Hayabusa', 'score': 50}
      ]
    },
    {
      'questionText': 'What\'s your favorite role',
      'answers': [
        {'text': 'Fighter', 'score': 10},
        {'text': 'Assassin', 'score': 20},
        {'text': 'Marksman', 'score': 30},
        {'text': 'Mage', 'score': 40},
      ]
    },
    {
      'questionText': 'What\'s your tier',
      'answers': [
        {'text': 'Mythic', 'score': 20},
        {'text': 'Legend', 'score': 10},
        {'text': 'Epic', 'score': 40},
        {'text': 'Grandmaster', 'score': 5},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("We have more questions");
    } else {
      print("No more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
