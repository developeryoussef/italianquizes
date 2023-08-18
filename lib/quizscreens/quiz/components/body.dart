import '../../../main.dart';
import 'question_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../model/constants.dart';
import '../../../controller/quizcontroller.dart';
// ignore_for_file: unused_import

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller

    return GetX<QuizController>(
      init: QuizController(),
      builder: (quizController) {
        quizController.getQuiz();
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
                      itemBuilder: (context, qustionindex) => Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        padding: EdgeInsets.all(kDefaultPadding),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            Text(
                              quizController.quiz[qustionindex].title,
                            ),
                            SizedBox(height: kDefaultPadding / 2),
                            ...List.generate(
                              quizController.quiz[qustionindex].options.length,
                              (index) {
                                return RadioListTile(
                                    value: index,
                                    groupValue: quizController
                                        .quiz[index].selectedOption,
                                    activeColor: itGreen,
                                    title: Text(quizController
                                        .quiz[qustionindex].options[index]),
                                    onChanged: (value) {
                                      quizController.quiz[qustionindex]
                                          .selectedOption = value;
                                      print(value);
                                      quizController.quizupdate();
                                      print(quizController
                                          .quiz[qustionindex].correctOption);
                                      print(
                                          'the sellected answer is ${quizController.quiz[qustionindex].selectedOption}');
                                      quizController
                                          .quiz[index].selectedOption = index;
                                    });
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            MaterialButton(
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
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
