import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Data/quiz.dart';

import 'answer_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;
  bool isButton = false;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      isButton = true;

      currentQuestionIndex++; // increments the value by 1
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final answer = currentQuestion.getShuffledAnswers();

    return SizedBox(
      width: double.infinity,
      child: AnimatedContainer(
        duration: const Duration(seconds: 5),
        curve: Curves.bounceOut,
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 200,
              height: 300,
              // decoration: BoxDecoration(
              //   color: Colors.black12,
              //   borderRadius: BorderRadius.all(Radius.circular(40)),
              //   border: Border.all(
              //       color: Color.fromARGB(255, 77, 98, 181), width: 5),
              // ),
              child: Center(
                child: Text(
                  currentQuestion.text,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      2, // You can change this value to adjust the number of columns
                  crossAxisSpacing: 40.0, // Adjust the spacing between columns
                  mainAxisSpacing: 50.0, // Adjust the spacing between rows
                ),
                itemCount: answer.length,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: Duration(seconds: 20),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: AnswerButton(
                      answerText: answer[index],
                      onTap: () {
                        answerQuestion(answer[index]);
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ...currentQuestion.getShuffledAnswers().map((answer) {
//               return