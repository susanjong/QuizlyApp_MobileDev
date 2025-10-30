class Question {
  final String id;
  final String questionText;
  final String? imageUrl;
  final List<Answer> answers;
  final String? explanation;

  Question({
    required this.id,
    required this.questionText,
    this.imageUrl,
    required this.answers,
    this.explanation,
  });
}

class Answer {
  final String id;
  final String text;
  final bool isCorrect;

  Answer({
    required this.id,
    required this.text,
    required this.isCorrect,
  });
}