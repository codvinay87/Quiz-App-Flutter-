import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 200,
          height: 100,
          decoration: BoxDecoration(
              // border:
              // Border.all(color: Color.fromARGB(255, 77, 98, 181), width: 5),
              borderRadius: BorderRadius.circular(40),
              color: Color.fromARGB(255, 31, 39, 72),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 13, 16, 28),
                    offset: Offset(5, 5),
                    blurRadius: 15,
                    spreadRadius: 1),
                BoxShadow(
                    color: Color.fromARGB(255, 44, 51, 87),
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1)
              ]),
          child: Center(
            child: Text(
              answerText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )),
    );

    // ElevatedButton(
    //     onPressed: onTap,
    //     style: ElevatedButton.styleFrom(
    //       padding: const EdgeInsets.symmetric(
    //         vertical: 10,
    //         horizontal: 40,
    //       ),
    //       backgroundColor: const Color.fromARGB(255, 33, 1, 95),
    //       foregroundColor: Colors.white,
    //       shape:
    //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    //     ),
    //     child: Text(
    //       answerText,
    //       textAlign: TextAlign.center,
    //     ));
  }
}
