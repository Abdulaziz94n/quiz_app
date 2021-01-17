import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function quizAnswers;

  Quiz(
      {@required this.questions,
      @required this.questionIndex,
      @required this.quizAnswers});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Text(questions.length.toString()),
        Question(questions[questionIndex]['questionText']
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((a) {
          return Answer(() => quizAnswers(a['score']), a['text']);
        }).toList()
      ],
    );
  }
}
