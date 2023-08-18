import '../../../main.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../model/Questions.dart';
import '../../../model/constants.dart';
import '../../../controller/question_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// ignore_for_file: unused_local_variable

// ignore_for_file: unused_import, deprecated_member_use

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    @required this.question,
  });

  final Question? question;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  String? answer;
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            widget.question!.question.toString(),
          ),
          SizedBox(height: kDefaultPadding / 2),
          ...List.generate(
            widget.question!.options!.length,
            (index) {
              return RadioListTile(
                value: widget.question!.options![index],
                groupValue: answer,
                activeColor: itGreen,
                title: Text(widget.question!.options![index]),
                onChanged: (value) {
                  setState(() {
                    answer = value;
                    print(answer);
                    print(value);
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
