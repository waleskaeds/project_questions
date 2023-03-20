import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  const Result({super.key, required this.totalScore});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            "Parabéns!",
            style: TextStyle(
              fontSize: 28
              ),
            ),
          Text(totalScore as String)
        ],
      ),
    );
  }
}