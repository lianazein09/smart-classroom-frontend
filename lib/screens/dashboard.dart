import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/lesson.dart';
import '../data/sample_data.dart';
import '../utils/ai_recommendation.dart';
import 'lesson_detail.dart';

class Dashboard extends StatefulWidget {
  final User user;

  const Dashboard({super.key, required this.user});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    Lesson? recommendation = getRecommendation(user, sampleLessons);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Classroom'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat datang, ${user.name}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (recommendation != null)
              Card(
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rekomendasi AI:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(recommendation.title),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LessonDetail(
                                lesson: recommendation!,
                                user: user,
                                onComplete: () {
                                  setState(() {
                                    user.completeLesson(recommendation!.id);
                                  });
                                },
                              ),
                            ),
                          );
                        },
                        child: const Text('Mulai Belajar'),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 20),
            const Text(
              'Daftar Pelajaran:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: sampleLessons.length,
                itemBuilder: (context, index) {
                  Lesson lesson = sampleLessons[index];
                  bool completed = user.isLessonCompleted(lesson.id);
                  return ListTile(
                    title: Text(lesson.title),
                    subtitle: Text(completed ? 'Selesai' : 'Belum selesai'),
                    trailing: completed ? const Icon(Icons.check, color: Colors.green) : null,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LessonDetail(
                            lesson: lesson,
                            user: user,
                            onComplete: () {
                              setState(() {
                                user.completeLesson(lesson.id);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}