import 'package:get/get.dart';
import 'package:mrs_geology/model/Question.dart';

class QuizController extends GetxController {
  List sample_data = [
    {
      "id": 1,
      "question":
          "Flutter is an open-source UI software development kit created by ______",
      "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
      "answer_index": 1,
    },
    {
      "id": 2,
      "question": "When google release Flutter.",
      "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
      "answer_index": 2,
    },
    {
      "id": 3,
      "question": "A memory location that holds a single letter or number.",
      "options": ['Double', 'Int', 'Char', 'Word'],
      "answer_index": 2,
    },
    {
      "id": 4,
      "question": "What command do you use to output data to the screen?",
      "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
      "answer_index": 2,
    },
  ];
  RxList<Question> quiz = <Question>[].obs;

  getQuiz() {
    quiz.value = sample_data
        .map(
          (question) => Question(
              id: question['id'],
              title: question['question'],
              options: question['options'],
              correctOption: question['answer_index']),
        )
        .toList();
  }

  int score = 0;

  @override
  void onInit() {
    super.onInit();
    getQuiz();
  }

  updateScore() {
    score = 0;
    quiz.forEach((element) {
      if (element.correctOption == element.selectedOption) score++;
    });
  }
}
