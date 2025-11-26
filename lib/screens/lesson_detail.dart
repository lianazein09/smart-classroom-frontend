import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../models/user.dart';

class LessonDetail extends StatefulWidget {
  final Lesson lesson;
  final User user;
  final VoidCallback onComplete;

  const LessonDetail({
    super.key,
    required this.lesson,
    required this.user,
    required this.onComplete,
  });

  @override
  _LessonDetailState createState() => _LessonDetailState();
}

class _LessonDetailState extends State<LessonDetail> {
  int currentQuestionIndex = 0;
  bool quizCompleted = false;

  @override
  Widget build(BuildContext context) {
    Lesson lesson = widget.lesson;

    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson.content,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              if (lesson.quiz.isNotEmpty && !quizCompleted)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kuis: ${lesson.quiz[currentQuestionIndex].question}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ...lesson.quiz[currentQuestionIndex].options.asMap().entries.map((entry) {
                      int idx = entry.key;
                      String option = entry.value;
                      return ElevatedButton(
                        onPressed: () {
                          if (idx == lesson.quiz[currentQuestionIndex].correctIndex) {
                            if (currentQuestionIndex < lesson.quiz.length - 1) {
                              setState(() {
                                currentQuestionIndex++;
                              });
                            } else {
                              setState(() {
                                quizCompleted = true;
                              });
                              widget.onComplete();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Kuis selesai! Pelajaran diselesaikan.')),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Jawaban salah, coba lagi.')),
                            );
                          }
                        },
                        child: Text(option),
                      );
                    }),
                  ],
                ),
              if (quizCompleted)
                const Text(
                  'Selamat! Anda telah menyelesaikan pelajaran ini.',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
            ],
          ),
        ),
      ),
    );
  }
}