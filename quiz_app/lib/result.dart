import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Function restartQuiz;
  final int resultScore;

  String get resultPhrase {
    String resultText = "";
    if (resultScore > 15)
      resultText = 'You are ... strange?!';
    else if (resultScore > 11)
      resultText = 'Pretty likable!';
    else if (resultScore > 7)
      resultText = 'You are awesome and innocent!';
    else
      resultText = 'You are so bad!';

    return resultText;
  }

  Result(this.resultScore, this.restartQuiz);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text("Restart Quiz!"),
            onPressed: restartQuiz,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
