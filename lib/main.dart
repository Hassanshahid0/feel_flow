import 'package:feel_flow/resources/app_colors.dart';
import 'package:feel_flow/resources/app_images.dart';
import 'package:feel_flow/src/auth_view/auth_screen.dart';
import 'package:feel_flow/src/auth_view/widgets/form_validation.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:feel_flow/src/dashboard/Home/Home.dart';
import 'package:feel_flow/utils/transation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'constants/constants.dart';
import 'dart:async';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        builder: BotToastInit(),
        key: navigatorKey,
        navigatorObservers: [BotToastNavigatorObserver()],
        // theme: ThemeData(fontFamily: 'proxima'),
        theme: ThemeData(
          focusColor: AppColors().pink,
          scaffoldBackgroundColor: AppColors().black,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors().pink,
            selectionHandleColor: AppColors().pink,
          ),
        ),
        home: SplashScreen(),
      );
    });
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _checkDataAvailability() async {
    bool dataAvailable = await check_saved_data_availability();
    // if (dataAvailable) {
    //   Get.off(
    //     HomePageWidget(),
    //     // LandingPage(),
    //     // LandingPageSticky(),
    //     duration: Duration(milliseconds: 3000),
    //     transition: Transition.native,
    //   );
    // } else
    {
      Get.off(
        () => AuthScreen(),
        duration: Duration(milliseconds: 500),
        transition: Transition.cupertino,
      );
    }
  }

  late Timer _timer;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      Get.off(
        () => AuthScreen(),
        duration: Duration(milliseconds: 1000),
        transition: Transition.cupertino,
      );
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _checkDataAvailability();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors().black, // Replace with your own background color
      body: Center(
        child: Image.asset(
          AppImages().appIcon, // Replace with your own app icon image path
          width: MediaQuery.of(context)
              .size
              .width, // Set width to full screen width
          height: MediaQuery.of(context)
              .size
              .height, // Set height to full screen height
          fit: BoxFit.cover, // Ensure the image covers the entire screen
        ),
      ),
    );
  }
}
