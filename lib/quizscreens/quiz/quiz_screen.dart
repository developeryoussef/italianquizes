import 'package:get/get.dart';
import 'components/body.dart';
import 'package:flutter/material.dart';
import '../../../model/constants.dart';
import '../../../controller/question_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// ignore_for_file: unused_import, duplicate_import

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Body(),
    );
  }
}
