import 'package:flutter/material.dart';
import 'package:project_questions/question.dart';
import 'answer.dart';


main(){
  runApp(QuestionsApp());
}

class _QuestionsAppState extends State<QuestionsApp> {
  var _questionSelect = 0;  
  final List<Map<String, Object>> _questions = [
     {
       'question': 'qual é sua cor favorita?',
       'answer'  : ['azul', 'roxo', 'rosa', 'amarelo'] 
     },
     {
       'question': 'qual é seu animal favorito',
       'answer'  : ['cachorro', 'gato', 'calopsita', 'coelho']
     },
     {
       'question': 'qual é sua comida favorita',
       'answer'  : ['pizza', 'hamburguer', 'sushi', 'mac cheese']
     }
   ];
  
   get haveQuestionSelect => _questionSelect < _questions.length; 

   void _responder() {
     setState(() {
       _questionSelect ++;
     });

  }

  @override
  Widget build(BuildContext context){

    List<String> answers = haveQuestionSelect 
    ?_questions[_questionSelect].cast()['answer']
    : [];

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
        ?Column(
          children: <Widget>[
            Question(_questions[_questionSelect]['question'].toString()),
            ...answers.map((t) => Answer(t, onSelect: (){_responder();})).toList()
          ],
        )
        : null,
      ),
    );
  }
}

class QuestionsApp extends StatefulWidget {
  State<QuestionsApp> createState(){
    return _QuestionsAppState();
  }
}