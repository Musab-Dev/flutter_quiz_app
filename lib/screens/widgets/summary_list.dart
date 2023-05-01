import 'package:flutter/material.dart';

class SummaryList extends StatelessWidget {
  const SummaryList({
    super.key,
    required this.summary,
  });

  final List<Map<String, Object>> summary;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: summary
            .map(
              (question) => Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white.withOpacity(0.7),
                      foregroundColor:
                          question['userAnswer'] == question['correntAnswer']
                              ? Colors.green
                              : Colors.red,
                      child: Text(
                        ((question['questionIndex'] as int) + 1).toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Que: ${question['questionText'] as String}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Your Answer: ${question['userAnswer'] as String}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Correct Answer: ${question['correctAnswer'] as String}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Divider(
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
