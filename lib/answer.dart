import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String texto;
  final void Function() onSelect;

  const Answer(this.texto, {super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ElevatedButton(
        onPressed: onSelect, 
        child: Text(
          texto,
          style: const TextStyle(
            color: Colors.white,
          ),
        ))
    );
  }
}