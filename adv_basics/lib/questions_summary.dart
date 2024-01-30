import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map(
          (data) {
            final isCorrectAnswer =
                data['choosenAnswer'] == data['correctAnswer'];
            return Row(
              children: [
                Text(
                  (data['question_index']).toString(),
                  style: TextStyle(
                      backgroundColor:
                          isCorrectAnswer ? Colors.green : Colors.red),
                ),
                //Text(((((data['question_index']).toString()) as int) + 1)
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        (data['question']).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        (data['correctAnswer']).toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        (data['choosenAnswer']).toString(),
                        style: TextStyle(
                            color: isCorrectAnswer ? Colors.green : Colors.red),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ).toList()),
      ),
    );
  }
}
