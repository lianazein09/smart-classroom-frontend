import '../models/user.dart';
import '../models/lesson.dart';

Lesson? getRecommendation(User user, List<Lesson> lessons) {
  // Simple AI: recommend the first incomplete lesson
  for (var lesson in lessons) {
    if (!user.isLessonCompleted(lesson.id)) {
      return lesson;
    }
  }
  return null; // All completed
}