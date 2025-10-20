import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget{
  const QuestionsSummary({super.key, required this.summaryData});

final List<Map<String, Object>> summaryData;
  
 @override
Widget build(BuildContext context) {
  return Column(
    children: summaryData.map((data) {
      final isCorrect = data['is_correct'] as bool;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: isCorrect ? const Color.fromARGB(255, 76, 155, 175) : const Color.fromARGB(255, 244, 54, 212),
              shape: BoxShape.circle,
            ),
            child: Text(
              ((data['question_index'] as int) + 1).toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['question'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Your answer: ${data['user_answer']}',
                  style: TextStyle(
                    color: isCorrect ? const Color.fromARGB(255, 56, 192, 255) : const Color.fromARGB(255, 189, 127, 247),
                  ),
                ),
                Text(
                  'Correct answer: ${data['correct_answer']}',
                  style: const TextStyle(color: Colors.greenAccent),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      );
    }).toList(),
  );
}
}