import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:adv_basics/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestartQuiz,
  });

  final List<String> chosenAnswers;
  final VoidCallback onRestartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      final bool isCorrect = chosenAnswers[i] == questions[i].answers[0];
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
        'isCorrect': isCorrect
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData();
    final numTotoalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotoalQuestions questions correctly!",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
              summaryData: summaryData,
            ),
            const SizedBox(
              height: 30,
            ),
            // TextButton(
            //   onPressed: () {},
            //   child: const Text('Restart Quize!'),
            // ),
            OutlinedButton.icon(
              onPressed: onRestartQuiz,
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(20)),
              icon: const Icon(Icons.rotate_right),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
