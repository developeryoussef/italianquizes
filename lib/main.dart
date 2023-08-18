import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'locale/translationcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mrs_geology/view/screens/onboarding.dart';
import 'package:mrs_geology/locale/translation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mrs_geology/view/screens/viewcontroller.dart';
// ignore_for_file: unused_import, prefer_const_constructors

SharedPreferences? sharedPreferences;
Color itGreen = Color.fromRGBO(0, 110, 85, 1);
Color itRed = Color.fromRGBO(206, 43, 55, 1);
Color itGrey = Color.fromARGB(255, 255, 255, 255);

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent.withOpacity(0),
      systemNavigationBarColor: itGreen,
      systemNavigationBarDividerColor: itGreen,
      systemNavigationBarContrastEnforced: true,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MrsGeologyAdmin());
}

class MrsGeologyAdmin extends StatelessWidget {
  const MrsGeologyAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
        theme: ThemeData.light(),
        locale: Locale('ar'),
        translations: MyLocale(),
        debugShowCheckedModeBanner: false,
        home: FirebaseAuth.instance.currentUser?.uid == null
            ? Onboarding3Widget()
            : ViewController());
  }
}
