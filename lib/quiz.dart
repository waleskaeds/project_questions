import 'package:flutter/material.dart';
import 'package:project_questions/question.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionSelect;
  final void Function(int) toRespond;

  const Quiz({super.key, required this.questions, required this.questionSelect, required this.toRespond});

  get haveQuestionSelect => questionSelect < questions.length; 

  @override
  Widget build(BuildContext context) {

    List<Map<String, Object>> answers = haveQuestionSelect 
    ? questions[questionSelect].cast()['answer'] as List<Map<String, Object>>
    : [];

    return Column(
      children: <Widget>[
        Question(questions[questionSelect]['question'].toString()),
        ...answers.map((resp) {
          return Answer(
            resp['text'].toString(), 
            onSelect: () {
              toRespond(int.parse(resp['points'].toString()));
            },
          );
        }).toList()
      ],
    );
  }
}