import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/img.png',
          width: 180,
          fit: BoxFit.fitWidth,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 80,
        ),
        Text(
          'Learn Flutter the fun way!',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 201, 153, 251),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white, padding: const EdgeInsets.all(20)),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
        )
      ],
    ));
  }
}
