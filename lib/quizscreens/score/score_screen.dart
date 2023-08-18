import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../controller/question_controller.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
              ),
              Spacer(),
              Text(
                "${_qnController.correctAns}/${_qnController.questions.length}",
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
