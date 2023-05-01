import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/screens/widgets/summary_list.dart';

class ResultContent extends StatelessWidget {
  const ResultContent({
    super.key,
    required this.quizSummary,
    required this.onRestartQuiz,
  });

  final List<Map<String, Object>> quizSummary;
  final void Function() onRestartQuiz;

  @override
  Widget build(BuildContext context) {
    final totalQuestion = questions.length;
    final totalCorrectAnswers = quizSummary
        .where((question) =>
            question['userAnswer'] as String ==
            question['correctAnswer'] as String)
        .length;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $totalCorrectAnswers out of $totalQuestion questions correctly',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.60,
            child: SummaryList(
              summary: quizSummary,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: onRestartQuiz,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              backgroundColor: const Color.fromARGB(255, 50, 3, 151),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.refresh),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Restart Quiz',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
