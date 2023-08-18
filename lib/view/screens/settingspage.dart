import '../../main.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../locale/translationcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, avoid_unnecessary_containers, library_private_types_in_public_api, unused_field, use_key_in_widget_constructors



class MySettingsScreen extends StatelessWidget {
  const MySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController langController = Get.put(LocalController());

    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      physics: BouncingScrollPhysics(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                child: Text(
                  '16'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            CircleAvatar(
              radius: 65,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                  '${FirebaseAuth.instance.currentUser?.photoURL}'),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
                onTap: () {},
                title:
                    Text('${FirebaseAuth.instance.currentUser?.displayName}'),
                subtitle: Text('${FirebaseAuth.instance.currentUser?.email}'),
                leading: Icon(
                  LineIcons.user,
                  size: 30,
                  color: itGreen,
                )),
            Divider(
              thickness: 1.2,
              color: Colors.grey.shade200,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                child: Text(
                  '17'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            ListTile(
                onTap: () {},
                title: Text('18'.tr),
                trailing: FutureBuilder<DocumentSnapshot>(
                  future: FirebaseFirestore.instance
                      .collection('students')
                      .doc(FirebaseAuth.instance.currentUser?.uid)
                      .get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    }

                    if (snapshot.hasData && !snapshot.data!.exists) {
                      return Text("Document does not exist");
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      Map<String, dynamic> data =
                          snapshot.data!.data() as Map<String, dynamic>;
                      return Text(
                        data['studentrank'].toString(),
                        style: TextStyle(color: itRed),
                      );
                    }

                    return Text("");
                  },
                ),
                leading: Icon(
                  Icons.leaderboard_outlined,
                  size: 30,
                  color: itGreen,
                )),
            ListTile(
                trailing: Icon(
                  sharedPreferences!.getString('lang') != 'ar'
                      ? LineIcons.arrowLeft
                      : LineIcons.arrowRight,
                ),
                onTap: () {
                  Get.bottomSheet(Container(
                    width: Get.width,
                    height: Get.height / 6,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: sharedPreferences!.getString('lang') == 'ar'
                                ? null
                                : () {
                                    langController.chngeLang('ar');
                                  },
                            title: Text(
                              'عربي',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing:
                                sharedPreferences!.getString('lang') == 'ar'
                                    ? Icon(
                                        LineIcons.language,
                                        color: itGreen,
                                      )
                                    : Icon(Icons.arrow_forward_ios_sharp),
                          ),
                          ListTile(
                            onTap: sharedPreferences!.getString('lang') != 'ar'
                                ? null
                                : () {
                                    langController.chngeLang('en');
                                  },
                            title: Text(
                              'English',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing:
                                sharedPreferences!.getString('lang') != 'ar'
                                    ? Icon(
                                        LineIcons.language,
                                        color: itGreen,
                                      )
                                    : Icon(Icons.arrow_forward_ios_sharp),
                          ),
                        ],
                      ),
                    ),
                  ));
                },
                title: Text('19'.tr),
                subtitle: Text(sharedPreferences!.getString('lang') == 'ar'
                    ? 'عربي'
                    : 'English'),
                leading: Icon(
                  LineIcons.language,
                  size: 30,
                  color: itGreen,
                )),
            ListTile(
                trailing: Icon(
                  sharedPreferences!.getString('lang') != 'ar'
                      ? LineIcons.arrowLeft
                      : LineIcons.arrowRight,
                ),
                onTap: () {
                  Get.bottomSheet(Container(
                    width: Get.width,
                    height: Get.height / 6,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ListTile(
                              onTap: () {
                                sharedPreferences!
                                    .setString('primary', 'Senior 3');
                              },
                              title: Text(
                                '24'.tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Icon(
                                LineIcons.school,
                                color: itGreen,
                              )),
                          ListTile(
                              onTap: () {
                                sharedPreferences!
                                    .setString('primary', 'Senior 2');
                              },
                              title: Text(
                                '25'.tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Icon(
                                LineIcons.school,
                                color: itGreen,
                              )),
                          ListTile(
                              onTap: () {
                                sharedPreferences!
                                    .setString('primary', 'Senior 3');
                              },
                              title: Text(
                                '26'.tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Icon(
                                LineIcons.school,
                                color: itGreen,
                              )),
                        ],
                      ),
                    ),
                  ));
                },
                title: Text('20'.tr),
                subtitle: Text(sharedPreferences!.getString('primary') != null
                    ? sharedPreferences!.getString('primary').toString()
                    : '24'.tr),
                leading: Icon(
                  Icons.school_outlined,
                  size: 30,
                  color: itGreen,
                )),
            ListTile(
                trailing: Icon(
                  sharedPreferences!.getString('lang') != 'ar'
                      ? LineIcons.arrowLeft
                      : LineIcons.arrowRight,
                ),
                onTap: () {
                  Get.bottomSheet(Container(
                    color: Colors.white,
                    width: Get.width,
                    height: Get.height / 5,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {
                              sharedPreferences!.setString('term', 'firsterm');
                            },
                            title: Text(
                              '22'.tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing:
                                sharedPreferences!.getString('lang') == 'ar'
                                    ? Icon(
                                        LineIcons.school,
                                        color: itGreen,
                                      )
                                    : Icon(Icons.arrow_forward_ios_sharp),
                          ),
                          ListTile(
                              onTap: () {
                                sharedPreferences!
                                    .setString('term', 'secondterm');
                              },
                              title: Text(
                                '22'.tr,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Icon(
                                LineIcons.school,
                                color: itGreen,
                              )),
                        ],
                      ),
                    ),
                  ));
                },
                title: Text('Term'),
                subtitle: Text(
                    sharedPreferences!.getString('term') == 'firsterm'
                        ? '22'.tr
                        : '23'.tr),
                leading: Icon(
                  LineIcons.school,
                  size: 30,
                  color: itGreen,
                )),
            ListTile(
                onTap: () {},
                title: Text('27'.tr),
                trailing: Text(
                  sharedPreferences!.getInt('quizesnumber') != null
                      ? sharedPreferences!.getInt('quizesnumber').toString()
                      : '0',
                  style: TextStyle(color: itRed),
                ),
                leading: Icon(
                  LineIcons.quoteRight,
                  size: 30,
                  color: itGreen,
                )),
            Divider(
              thickness: 1.2,
              color: Colors.grey.shade200,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                child: Text(
                  '28'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            ListTile(
                onTap: () {},
                title: Text('29'.tr),
                trailing: Icon(
                  sharedPreferences!.getString('lang') != 'ar'
                      ? LineIcons.arrowLeft
                      : LineIcons.arrowRight,
                ),
                subtitle: Text('30'.tr),
                leading: Icon(
                  LineIcons.phone,
                  size: 30,
                  color: itGreen,
                )),
            ListTile(
                onTap: () {},
                title: Text('29'.tr),
                trailing: Icon(
                  sharedPreferences!.getString('lang') != 'ar'
                      ? LineIcons.arrowLeft
                      : LineIcons.arrowRight,
                ),
                subtitle: Text('31'.tr),
                leading: Icon(
                  LineIcons.whatSApp,
                  size: 30,
                  color: itGreen,
                )),
            ListTile(
                onTap: () {},
                trailing: Icon(
                  sharedPreferences!.getString('lang') != 'ar'
                      ? LineIcons.arrowLeft
                      : LineIcons.arrowRight,
                ),
                title: Text('32'.tr),
                subtitle: Text('32'.tr),
                leading: Icon(
                  Icons.engineering_outlined,
                  size: 30,
                  color: itGreen,
                )),
          ],
        ),
      ),
    );
  }
}
