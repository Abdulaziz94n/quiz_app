import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function restartQuiz;
  Result(this.resultScore , this.restartQuiz);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 1) {
      resultText = 'you are awesome';
    } else if (resultScore <= 2) {
      resultText = ('Pretty likable');
    } else if (resultScore <= 3) {
      resultText = ('you are ... strange');
    } else {
      resultText = 'you are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            color: Colors.blue,
              textColor: Colors.white,
              onPressed: restartQuiz,
              child: Text(
                'Restart Quiz',
              ))
        ],
      ),
    );
  }
}
