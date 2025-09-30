import 'package:flutter/material.dart';
import 'package:quiz_app_fa25/questions_screen.dart';
import 'package:quiz_app_fa25/start_screen.dart';
import 'package:quiz_app_fa25/results_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }

}
class _QuizState extends State<Quiz>{
 Widget? activeScreen;
 List<String> selectedAnswers = [];

 void chooseAnswer(String answer) {
  selectedAnswers.add(answer);
  if (selectedAnswers.length == questions.length) {
    setState((){
      selectedAnswers = [];
      activeScreen = StartScreen(switchScreen);
    });
  }
 }

@override 
void initState(){
  activeScreen = StartScreen(switchScreen);
  super.initState();
}

 void switchScreen(){
  setState((){
      activeScreen = QuestionsScreen(
        onSelectedAnswer: chooseAnswer,
      );
    });
 }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ]
            ),
          ),
          child: activeScreen,
      ), 
      ),
    );
  }
}