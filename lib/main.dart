import 'package:flutter/material.dart';
import 'package:project_questions/quiz.dart';
import 'package:project_questions/result.dart';

main(){
  runApp(QuestionsApp());
}

class _QuestionsAppState extends State<QuestionsApp> {
  var _questionSelect = 0;  

  var _totalScore = 0;

  final List<Map<String, Object>> _questions = [
     {
       'question': 'qual é sua cor favorita?',
       'answer'  : [
        {'text' : 'azul',     'points' : 10},
        {'text' : 'roxo',     'points' : 5},
        {'text' : 'rosa',     'points' : 3},
        {'text' : 'amarelo',  'points' : 1},
        ] 
     },
     {
       'question': 'qual é seu animal favorito',
       'answer'  : [
        {'text' : 'cachorro',  'points' : 10},
        {'text' : 'gato',      'points' : 5},
        {'text' : 'calopsita', 'points' : 3},
        {'text' : 'coelho',    'points' : 1},
        ]
     },
     {
       'question': 'qual é sua comida favorita',
       'answer'  : [
          {'text' : 'pizza',      'points' : 10},
          {'text' : 'hamburguer', 'points' : 5},
          {'text' : 'sushi',      'points' : 3},
          {'text' : 'mac cheese', 'points' : 1},
        ]
     }
   ];
  
    get haveQuestionSelect => _questionSelect < _questions.length; 

   void _toRespond(int points) {
    if (haveQuestionSelect) {
      setState(() {
       _questionSelect ++;
       _totalScore += points;
     }); 
    }

  }

  @override
  Widget build(BuildContext context){

    // List<String> answers = haveQuestionSelect 
    // ?_questions[_questionSelect].cast()['answer']
    // : [];

    // for(String textAnswer in answers){
    //   widgets.add(Answer(textAnswer, onSelect: () {_responder();})
    //   );
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: haveQuestionSelect 
        ? Quiz(
          questions: _questions, 
          questionSelect: _questionSelect, 
          toRespond: _toRespond)
        : Result(totalScore: _totalScore),
      ),
    );
  }
}

class QuestionsApp extends StatefulWidget {
  State<QuestionsApp> createState(){
    return _QuestionsAppState();
  }
}