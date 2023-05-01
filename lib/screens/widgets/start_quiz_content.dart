import 'package:flutter/material.dart';

class StartQuizContent extends StatelessWidget {
  const StartQuizContent({
    super.key,
    required this.onStart,
  });

  final void Function() onStart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz_logo.png',
            width: 300,
            color: Colors.white.withOpacity(0.4),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Let\'s Learn Flutter with some fun!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: onStart,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              backgroundColor: const Color.fromARGB(255, 50, 3, 151),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: const Text(
              'Start Quiz',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
