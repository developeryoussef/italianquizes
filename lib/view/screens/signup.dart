// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, unused_import, unnecessary_null_comparison, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mrs_geology/main.dart';
import 'package:mrs_geology/view/screens/signin.dart';
import 'package:mrs_geology/view/screens/viewcontroller.dart';

import '../../controller/authservices.dart';
import '../widgets/customtextformauth.dart';
import '../widgets/text.dart';

class SignUpS extends StatefulWidget {
  const SignUpS({super.key});

  @override
  State<SignUpS> createState() => _SignUpSState();
}

class _SignUpSState extends State<SignUpS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: GetBuilder<AuthServices>(
        init: AuthServices(),
        builder: (authServices) {
          return SafeArea(
            child: ListView(
              padding: EdgeInsets.all(20),
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: 35,
                ),
                Center(child: signoratext!),
                signUpText!,
                CustomTextFormAuth(
                    hinttext: '5'.tr,
                    labeltext: '5'.tr,
                    iconData: LineIcons.user,
                    mycontroller: authServices.signUpUsrnController,
                    valid: (p0) {
                      return null;
                    },
                    isNumber: false),
                CustomTextFormAuth(
                    hinttext: '6'.tr,
                    labeltext: '6'.tr,
                    iconData: LineIcons.user,
                    mycontroller: authServices.signUpEmailController,
                    valid: (p0) {
                      return null;
                    },
                    isNumber: false),
                CustomTextFormAuth(
                    hinttext: '8'.tr,
                    labeltext: '7'.tr,
                    iconData: LineIcons.user,
                    mycontroller: authServices.signUpPswrdController,
                    valid: (p0) {
                      return null;
                    },
                    isNumber: false),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  padding: EdgeInsets.zero,
                  child: Container(
                    child: Center(
                      child: Text(
                        '9'.tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                    height: 60,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 7,
                            color: Colors.black.withOpacity(0.25))
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: itGreen,
                    ),
                  ),
                  onPressed: () async {
                    if ((authServices.signUpUsrnController!.text == '' ||
                        authServices.signUpUsrnController!.text == null)) {
                      Get.snackbar('Signup Error', 'Write the username');
                    } else if ((authServices.signUpEmailController!.text ==
                            '' ||
                        authServices.signUpEmailController!.text == null)) {
                      Get.snackbar('Signup Error', 'Write the email');
                    } else if ((authServices.signUpPswrdController!.text ==
                            '' ||
                        authServices.signUpPswrdController!.text == null)) {
                      Get.snackbar('Signup Error', 'Write the password');
                    } else {
                      var response = await authServices.signUpMethod();
                      if (response != null) {
                        Get.offAll(ViewController());

                        await FirebaseFirestore.instance
                            .collection('students')
                            .doc(FirebaseAuth.instance.currentUser?.uid)
                            .set({
                          'imageurl':
                              'https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg',
                          'name': authServices.signUpUsrnController!.text,
                          'email': authServices.signUpEmailController!.text,
                          'studentrank': 0,
                          'uid': FirebaseAuth.instance.currentUser?.uid,
                        });
                        print(authServices.signUpEmailController!.text);
                        print(authServices.signUpPswrdController!.text);
                        Get.snackbar('Register System',
                            'Registeration finished succesfully');
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '10'.tr,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(SignInS());
                        },
                        child: Text('11'.tr,
                            style: TextStyle(
                              color: itGreen,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
