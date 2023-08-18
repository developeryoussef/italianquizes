// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, await_only_futures, unused_import, unnecessary_null_comparison, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mrs_geology/main.dart';
import 'package:mrs_geology/view/screens/viewcontroller.dart';

import '../../controller/authservices.dart';
import '../widgets/customtextformauth.dart';
import '../widgets/text.dart';

class SignInS extends StatefulWidget {
  const SignInS({super.key});

  @override
  State<SignInS> createState() => _SignInSState();
}

class _SignInSState extends State<SignInS> {
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
                signInText!,
                CustomTextFormAuth(
                    hinttext: '6'.tr,
                    labeltext: '6'.tr,
                    iconData: LineIcons.user,
                    mycontroller: authServices.signInEmailController,
                    valid: (p0) {
                      return null;
                    },
                    isNumber: false),
                CustomTextFormAuth(
                    hinttext: '8'.tr,
                    labeltext: '7'.tr,
                    iconData: LineIcons.user,
                    mycontroller: authServices.signInPswrdController,
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
                        '11'.tr,
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
                    if ((authServices.signInEmailController!.text == '' ||
                        authServices.signInEmailController!.text == null)) {
                      Get.snackbar('Signin Error', 'Write the email');
                    } else if ((authServices.signInPswrdController!.text ==
                            '' ||
                        authServices.signInPswrdController!.text == null)) {
                      Get.snackbar('Signin Error', 'Write the password');
                    } else {
                      var response = await authServices.signInMethod();
                      if (response != null) {
                        Get.offAll(ViewController());

                        await FirebaseFirestore.instance
                            .collection('students')
                            .doc(FirebaseAuth.instance.currentUser?.uid)
                            .set({
                          'imageurl':
                              'https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg',
                          'email': authServices.signInEmailController!.text,
                          'uid': FirebaseAuth.instance.currentUser?.uid,
                        });
                        print(authServices.signUpEmailController!.text);
                        print(authServices.signUpPswrdController!.text);
                        Get.snackbar(
                            'Signin System', 'Logging in finished succesfully');
                      }
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
