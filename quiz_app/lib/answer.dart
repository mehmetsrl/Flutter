import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

final Function _selectHandler;
final String _answerText;

Answer(this._selectHandler,this._answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      child:RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(_answerText),
        onPressed: _selectHandler,
      ),
    );
  }
}
