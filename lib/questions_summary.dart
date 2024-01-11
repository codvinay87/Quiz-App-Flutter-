import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:quiz_app/Data/quiz.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: data['correct_answer'] == data['user_answer']
                          ? Colors.green
                          : Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        ((data['questions_index'] as int) + 1).toString(),
                        style: GoogleFonts.museoModerno(
                            color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: 30,
                          // ),
                          Text(
                            data['question'] as String,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: TextStyle(
                                color: data['correct_answer'] ==
                                        data['user_answer']
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: const TextStyle(
                                color: Colors.cyan, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
