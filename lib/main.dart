import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/result.dart';
import 'answer.dart';
import 'quiz.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  final _questions = const [
    {
      'questionText': 'What is your fav color?',
      'answers': [
        {'text': 'Black', 'score': 3},
        {'text': 'White', 'score': 5},
        {'text': 'Green', 'score': 7},
        {'text': 'red', 'score': 4},
      ]
    },
    {
      'questionText': 'What is your fav animal?',
      'answers': [
        {'text': 'Bat', 'score': 1},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Lion', 'score': 5}
      ]
    },
    {
      'questionText': 'who is your fav teacher ?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'shaun li', 'score': 3}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('We Have More Questions');
    } else
      print('no more questions');
  }
void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz Application'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questionIndex: _questionIndex,
                  questions: _questions,
                  quizAnswers: _answerQuestion,
                )
              : Result(_totalScore , _resetQuiz)),
    );
  }
}
