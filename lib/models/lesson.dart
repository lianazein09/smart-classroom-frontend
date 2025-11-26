class Lesson {
  final int id;
  final String title;
  final String content;
  final List<QuizQuestion> quiz;

  Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.quiz,
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}