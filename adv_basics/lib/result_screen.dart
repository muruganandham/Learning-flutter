import 'package:flutter/material.dart';
import 'package:adv_basics/data/data.dart';
import 'package:adv_basics/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choosenAnswers,
    required this.onRestartQuiz,
  });

  final List<String> choosenAnswers;
  final void Function() onRestartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < questions.length; i++) {
      summary.add({
        'question_index': (i + 1).toString(),
        'question': questions[i].question,
        'choosenAnswer': choosenAnswers[i],
        'correctAnswer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> summaryData = getSummaryData();
    final correctAnswers = summaryData.where((question) {
      return question['choosenAnswer'] == question['correctAnswer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'You answered $correctAnswers of ${questions.length} questions correctly.'),
              const SizedBox(
                height: 30,
              ),
              QuestionSummary(
                getSummaryData(),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: onRestartQuiz,
                child: const Text("Restart Quiz"),
              ),
            ],
          ),
        ));
  }
}
