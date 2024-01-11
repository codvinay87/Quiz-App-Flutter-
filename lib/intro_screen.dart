import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreenScaffold extends StatelessWidget {
  const IntroScreenScaffold(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Image.asset(
          "assets/images/quiz_logo.png",
          width: 300,
        )),
        const SizedBox(
          height: 50,
        ),
        Text(
          "Learn Flutter The Fun Way ",
          style: GoogleFonts.lato(
              color: Color.fromARGB(255, 248, 154, 255), fontSize: 24),
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text("Start Quiz"),
        ),
      ],
    );
  }
}
