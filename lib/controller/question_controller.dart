import 'package:get/get.dart';
import '../model/Question.dart';
import 'package:flutter/widgets.dart';
import '../quizscreens/score/score_screen.dart';
// ignore_for_file: unused_field

// ignore_for_file: deprecated_member_use

class QuestionController extends GetxController {
  late PageController _pageController;
  PageController get pageController => this._pageController;

  bool _isAnswered = false;
  late int _correctAns;
  int get correctAns => this._correctAns;
  late int _selectedAns;
  int get selectedAns => this._selectedAns;
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;
  int _numOfCorrectAns = 0;
  @override
  void onInit() {
    _pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.correctOption;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns += 1;
      print(_numOfCorrectAns);
    }
    update();
  }

  // void nextQuestion() {
  //   if (_questionNumber.value != _questions.length) {
  //     _isAnswered = false;
  //     _pageController.nextPage(
  //         duration: Duration(milliseconds: 500), curve: Curves.ease);
  //   } else {
  //     Get.to(ScoreScreen());
  //   }
  // }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }

  changequestion(int index) {}
}
