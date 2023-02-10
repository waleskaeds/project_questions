import 'package:flutter/material.dart';
import 'package:project_questions/question.dart';

main(){
  runApp(QuestionsApp());
}

class _QuestionsAppState extends State<QuestionsApp> {
   var _questionSelect = 0; 

  void _responder() {
    setState(() {
      _questionSelect ++;
    });
    print(_questionSelect);
  }

  @override
  Widget build(BuildContext context){
    
    final questions = [
    'qual é sua cor favorita?',
    'qual é seu animal favorito',
    'qual é sua comida favorita',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: <Widget>[
            Question(questions[_questionSelect]),
            ElevatedButton(
              onPressed: _responder,
              child: Text('resposta 1'),
            ),
            ElevatedButton(
              onPressed: _responder,
              child: Text('resposta 2'),
            ),
            ElevatedButton(
              onPressed: _responder,
              child: Text('resposta 3'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionsApp extends StatefulWidget {
  State<QuestionsApp> createState(){
    return _QuestionsAppState();
  }
}