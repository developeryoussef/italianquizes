import '../../main.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mrs_geology/quizscreens/quiz/quiz_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mrs_geology/quizscreens/quiz/components/body.dart';

// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, unused_local_variable, avoid_print, unnecessary_cast

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('quizes')
              .doc('${sharedPreferences!.getString('term')}')
              .collection('quizes')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: itRed,
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.active) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var data =
                      snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  var did = snapshot.data!.docs[index].id;
                  return GestureDetector(
                    onTap: () {
                      Get.to(QuizScreen());
                    },
                    child: Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              LineIcons.question,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            Text(
                              data['name'],
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      width: Get.width - 300,
                      height: 100,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: itGreen),
                    ),
                  );
                },
              );
            }
            return Center(
              child: Text('There is\'n quizes yet'),
            );
          },
        ));
  }
}
