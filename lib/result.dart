import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback selectHandler;

  Result(this.resultScore, this.selectHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 20) {
      resultText = "Awesome";
    } else if (resultScore <= 30) {
      resultText = "Youre Good";
    } else if (resultScore <= 40) {
      resultText = "Impresive";
    } else {
      resultText = "Incredible";
    }

    print(resultText);
    print(resultScore);

    return resultText;
  }

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
          TextButton(
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 22, color: Colors.blue),
            ),
            child: Text('Restart Quiz!'),
            onPressed: selectHandler,
            // textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
