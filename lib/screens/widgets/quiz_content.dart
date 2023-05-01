import 'package:flutter/material.dart';

import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/screens/widgets/answer_button.dart';

class QuizContent extends StatefulWidget {
  const QuizContent({
    super.key,
    required this.onAnswerQuestion,
  });

  final void Function(String selectedAnswer) onAnswerQuestion;

  @override
  State<QuizContent> createState() => _QuizContentState();
}

class _QuizContentState extends State<QuizContent> {
  var currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ...currentQuestion.shuffledAnswers.map(
            (answer) => AnswerButton(
              text: answer,
              onPressed: () {
                setState(() {
                  currentQuestionIndex++;
                });
                widget.onAnswerQuestion(answer);
              },
            ),
          ),
        ],
      ),
    );
  }
}
