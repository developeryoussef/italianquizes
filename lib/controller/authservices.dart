// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace, sort_child_properties_last, unnecessary_import, avoid_web_libraries_in_flutter, unused_import, prefer_typing_uninitialized_variables, unused_local_variable, depend_on_referenced_packages, prefer_interpolation_to_compose_strings, await_only_futures, body_might_complete_normally_nullable, unnecessary_null_comparison

import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrs_geology/view/screens/viewcontroller.dart';

class AuthServices extends GetxController {
  bool? isObscure = true;
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  FirebaseFirestore? myDb = FirebaseFirestore.instance;
  TextEditingController? signUpUsrnController = TextEditingController();
  TextEditingController? signUpEmailController = TextEditingController();
  TextEditingController? signUpPswrdController = TextEditingController();
  TextEditingController? signInEmailController = TextEditingController();
  TextEditingController? signInPswrdController = TextEditingController();

  var name;
  var email;
  var imageurl;
  var rank;

  Future<UserCredential> signInWithGoogleMethod() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signinWithGoogle() async {
    var response = await signInWithGoogleMethod();
    if (response != null) {
      Get.offAll(ViewController());
      return await FirebaseFirestore.instance
          .collection('students')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        'name': FirebaseAuth.instance.currentUser?.displayName,
        'email': FirebaseAuth.instance.currentUser?.email,
        'imageurl': 'https://pbs.twimg.com/media/FjU2lkcWYAgNG6d.jpg',
        'studentrank': 0,
      });
    }
  }

  Future<UserCredential?> signUpMethod() async {
    try {
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signUpEmailController!.text,
        password: signUpEmailController!.text,
      );
      print(signUpEmailController!.text.toString());
      print(signUpPswrdController!.text.toString());

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Auth system', 'the password is very weak');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Auth system', 'this email already in use');
      }
    } catch (e) {}
  }

  Future<UserCredential?> signInMethod() async {
    try {
      print(signInEmailController!.text);
      print(signInPswrdController!.text);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signInEmailController!.text,
        password: signInPswrdController!.text,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Auth system', 'Wrong email or password');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Auth system', 'Wrong password');
      }
    }
  }
}
