import '../../../main.dart';
import 'question_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../model/constants.dart';
import 'package:mrs_geology/model/Question.dart';
import '../../../controller/quizcontroller.dart';

// ignore_for_file: unused_import

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
// final QuizController quizController = Get.find();
    return GetX<QuizController>(
      init: QuizController(),
      builder: (quizController) {
        print("build");
        return Stack(
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: kDefaultPadding),
                  Divider(thickness: 1.5),
                  SizedBox(height: kDefaultPadding),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: quizController.quiz.length,
                      itemBuilder: (context, qustionindex) {
                        Question currentQuetion =
                            quizController.quiz[qustionindex];
                        return Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          padding: EdgeInsets.all(kDefaultPadding),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            children: [
                              Text(currentQuetion.title),
                              SizedBox(height: kDefaultPadding / 2),
                              ...List.generate(
                                currentQuetion.options.length,
                                (index) {
                                  return RadioListTile(
                                      value: index,
                                      groupValue: currentQuetion.selectedOption,
                                      activeColor: itGreen,
                                      title:
                                          Text(currentQuetion.options[index]),
                                      onChanged: (value) {
                                        currentQuetion.selectedOption = value;
                                        print("Selected Answer => $value");
                                        print(
                                            "Corrected Answer => ${currentQuetion.correctOption}");
                                        currentQuetion.selectedOption = index;
                                        quizController.quiz.refresh();
                                      });
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                child: Text("data"),
                                onPressed: () {
                                  quizController.quiz.forEach((element) {
                                    print(
                                        element.options[element.correctOption]);
                                  });
                                  quizController.updateScore();
                                  quizController.score;
                                  print(
                                      "your score is ${quizController.score}");
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
