import '../../main.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../quizscreens/welcome/welcome_screen.dart';
import 'package:mrs_geology/view/screens/homepage.dart';
import 'package:mrs_geology/view/screens/settingspage.dart';
import 'package:mrs_geology/quizscreens/quiz/quiz_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace, avoid_unnecessary_containers, library_private_types_in_public_api, unused_field, use_key_in_widget_constructors

class ViewController extends StatefulWidget {
  @override
  _ViewControllerState createState() => _ViewControllerState();
}

class _ViewControllerState extends State<ViewController> {
  @override
  void initState() {
    sharedPreferences!.getString('term') != 'firsterm' ||
            sharedPreferences!.getString('term') != 'secondterm'
        ? sharedPreferences!.setString('term', 'firsterm')
        : null;

    super.initState();
  }

  int currentindex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MySettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentindex != 2
          ? AppBar(
              iconTheme: currentindex == 2 ? null : IconThemeData.fallback(),
              actions: currentindex != 2
                  ? null
                  : [
                      IconButton(onPressed: () {}, icon: Icon(LineIcons.search))
                    ],
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                currentindex == 0 ? '13'.tr : '15'.tr,
                style: TextStyle(color: Colors.black),
              ),
            )
          : null,
      backgroundColor: itGrey,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _widgetOptions[currentindex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 600),
        color: itGreen,
        backgroundColor: Colors.transparent.withOpacity(0),
        items: [
          Icon(
            LineIcons.home,
            color: itGrey,
            size: 30,
          ),
          Icon(LineIcons.user, color: itGrey, size: 30),
        ],
        index: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}
