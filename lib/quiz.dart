import 'package:flutter/material.dart';
import 'package:quiz_app/Data/quiz.dart';
import 'package:quiz_app/intro_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   activeScreen = IntroScreenScaffold(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = IntroScreenScaffold(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuizScreen(onSelectAnswer: chooseAnswer);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        restart: restart,
      );
    }
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 31, 39, 72)),
          child: screenWidget,
        ),
      ),
    );
  }
}
