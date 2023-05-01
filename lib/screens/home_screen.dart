import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';

import 'package:flutter_quiz_app/screens/widgets/start_quiz_content.dart';
import 'package:flutter_quiz_app/screens/widgets/quiz_content.dart';
import 'package:flutter_quiz_app/screens/widgets/result_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget? currentScreen;
  List<String> userAnswers = [];

  @override
  void initState() {
    currentScreen = StartQuizContent(onStart: startQuiz);
    super.initState();
  }

  List<Map<String, Object>> get quizSummary {
    List<Map<String, Object>> quizSummary = [];
    for (int i = 0; i < userAnswers.length; i++) {
      quizSummary.add(
        {
          'questionIndex': i,
          'questionText': questions[i].text,
          'userAnswer': userAnswers[i],
          'correctAnswer': questions[i].answers[0],
        },
      );
    }
    return quizSummary;
  }

  void startQuiz() {
    setState(() {
      currentScreen = QuizContent(
        onAnswerQuestion: answerQuestion,
      );
    });
  }

  void answerQuestion(String selectedAnswer) {
    userAnswers.add(selectedAnswer);
    if (userAnswers.length == questions.length) {
      setState(() {
        currentScreen = ResultContent(
          quizSummary: quizSummary,
          onRestartQuiz: restartQuiz,
        );
      });
    }
  }

  void restartQuiz() {
    setState(() {
      currentScreen = QuizContent(
        onAnswerQuestion: answerQuestion,
      );
      userAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 22, 20, 127),
              Color.fromARGB(255, 68, 65, 252),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: currentScreen,
      ),
    );
  }
}
