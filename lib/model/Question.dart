class Question {
  final int id;
  final String title;
  final List<String> options;
  final int correctOption;

  int? selectedOption;

  Question({
    required this.id,
    required this.title,
    required this.correctOption,
    required this.options,
    this.selectedOption,
  });
}
