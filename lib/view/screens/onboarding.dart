import '../../main.dart';
import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:line_icons/line_icons.dart';
import '../../controller/authservices.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mrs_geology/view/screens/signup.dart';
import 'package:mrs_geology/view/screens/viewcontroller.dart';

// ignore_for_file: unused_import, duplicate_import, unused_local_variable, unnecessary_null_comparison


class Onboarding3Widget extends StatefulWidget {
  const Onboarding3Widget({Key? key}) : super(key: key);

  @override
  _Onboarding3WidgetState createState() => _Onboarding3WidgetState();
}

class _Onboarding3WidgetState extends State<Onboarding3Widget> {
  @override
  Widget build(BuildContext context) {
    AuthServices controller = Get.put(AuthServices());
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(
              maxWidth: 670,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          'https://images.pexels.com/photos/16353852/pexels-photo-16353852/free-photo-of-cars-and-people-under-italian-flag-rome-italy.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                        ).image,
                      ),
                    ),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0x00FFFFFF), Colors.white],
                          stops: [0, 0.9],
                          begin: AlignmentDirectional(0, -1),
                          end: AlignmentDirectional(0, 1),
                        ),
                      ),
                      alignment: AlignmentDirectional(0, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 50, right: 10, left: 10),
                  child: Center(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Signora Sara\n'
                            'Italian exams',
                            style: TextStyle(
                                fontSize: 35,
                                height: 1.25,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                                letterSpacing: 1),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          MaterialButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              Get.to(SignUpS());
                            },
                            child: Container(
                              height: 65,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 7,
                                      color: Colors.black.withOpacity(0.25))
                                ],
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: ListTile(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 60),
                                  leading: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    '1'.tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '3'.tr,
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            padding: EdgeInsets.all(0),
                            onPressed: () async {
                              await controller.signinWithGoogle();
                            },
                            child: Container(
                              height: 72,
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: itGreen,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 7,
                                      color: Colors.black.withOpacity(0.25))
                                ],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: ListTile(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 60),
                                  leading: Icon(
                                    LineIcons.googleLogo,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  title: Text(
                                    '2'.tr,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

