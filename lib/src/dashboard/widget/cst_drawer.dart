import 'package:feel_flow/resources/app_colors.dart';
import 'package:feel_flow/src/auth_view/auth_screen.dart';
// import 'package:feel_flow/src/dashboard/calander_view.dart';
// import 'package:feel_flow/src/dashboard/camera_screen.dart';
// import 'package:feel_flow/src/dashboard/feedback.dart';
// import 'package:feel_flow/src/dashboard/graph_view.dart';
// import 'package:feel_flow/src/dashboard/landing_page.dart';
// import 'package:feel_flow/src/dashboard/notes.dart';
// import 'package:feel_flow/src/dashboard/profile.dart';
// import 'package:feel_flow/src/dashboard/select_mood.dart';
// import 'package:feel_flow/src/dashboard/select_mood_detail.dart';
import 'package:feel_flow/src/dashboard/camera_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../calander_view.dart';
import '../notes.dart';
import '../profile/profile.dart';
import '../select_mood_detail.dart';

class cstDrawer extends StatefulWidget {
  cstDrawer({
    super.key,
  });

  @override
  State<cstDrawer> createState() => _cstDrawerState();
}

class _cstDrawerState extends State<cstDrawer> {
  get bottomNavigationBarHeight => null;

  void popScreen(BuildContext context) {
    // Pop the current screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors().black,
            ),
            child: const Text(
              'Feel Flow Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('AR Camera'),
            onTap: () {
              Get.off(
                () => CameraScreen(),
                duration: Duration(milliseconds: 100),
                transition: Transition.cupertino,
              );
            },
          ),
          ListTile(
            title: const Text('Calander'),
            onTap: () {
              Get.off(
                () => CalanderView(),
                duration: Duration(milliseconds: 100),
                transition: Transition.cupertino,
              );
              //CalanderView
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Get.off(
                () => ProfileView(),
                duration: Duration(milliseconds: 100),
                transition: Transition.cupertino,
              );
            },
          ),
          ListTile(
            title: const Text('Notes'),
            onTap: () {
              Get.off(
                const NotesView(),
                duration: const Duration(milliseconds: 100),
                transition: Transition.cupertino,
              );
            },
          ),
          ListTile(
            title: const Text('Select Mood'),
            onTap: () {
              Get.off(
                const ChooseMoodDetail(),
                duration: const Duration(milliseconds: 100),
                transition: Transition.cupertino,
              );
            },
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.clear();
              Get.off(
                const AuthScreen(),
                duration: const Duration(milliseconds: 100),
                transition: Transition.cupertino,
              );
            },
          ),
          // Add more items as needed
        ],
      ),
    );
  }
}
