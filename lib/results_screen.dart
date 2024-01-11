import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Data/quiz.dart';
// import 'package:quiz_app/intro_screen.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.restart});

  final List<String> chosenAnswers;

  final void Function() restart;

  List<Map<String, Object>> get SummaryData {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'questions_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = SummaryData;

    final totalNumberOfQuestions = questions.length;
    final correctedQuestion = SummaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You Answered $correctedQuestion out of $totalNumberOfQuestions questions correctly!",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(SummaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
                onPressed: restart,
                icon: Icon(Icons.refresh_rounded),
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                label: const Text("Restart Quiz!"))
          ],
        ),
      ),
    );
  }
}
