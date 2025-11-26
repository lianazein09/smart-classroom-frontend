class User {
  final int id;
  final String name;
  Map<int, bool> progress; // lesson id to completed

  User({
    required this.id,
    required this.name,
    required this.progress,
  });

  void completeLesson(int lessonId) {
    progress[lessonId] = true;
  }

  bool isLessonCompleted(int lessonId) {
    return progress[lessonId] ?? false;
  }
}