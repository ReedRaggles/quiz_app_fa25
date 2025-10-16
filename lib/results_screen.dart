import 'package:flutter/material.dart';
import 'package:quiz_app_fa25/data/questions.dart';
import 'package:quiz_app_fa25/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
const ResultsScreen({super.key, required this.chosenAnswers});
final List<String> chosenAnswers;

List<Map<String,Object>> getSummaryData(){
  List<Map<String, Object>> summary = [];

  for(var i = 0;i < chosenAnswers.length;i++)
  {
    summary.add(
      {
        'questions_index' :i,
        'question' :questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      }
    );
  }
  return summary;
}

@override
Widget build(Context)
{
  return SizedBox(
    width: double.infinity,
    child: Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You answered X out of Y questions Correctly'),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData: getSummaryData()),
          const SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    ),
  );
}
}