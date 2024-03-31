import 'dart:ui';

//import 'package:feel_flow/src/auth_view/signup_screen.dart';
import 'package:feel_flow/src/auth_view/widgets/forget_pass.dart';
import 'package:feel_flow/src/auth_view/widgets/form_field.dart';
import 'package:feel_flow/src/dashboard/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sizer/sizer.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';
import 'dart:async';
import '../../utils/zbotToast.dart';
import 'signup_screen.dart';
import 'widgets/button1.dart';
import 'widgets/fingerprint.dart';
//import '../dashboard/home_page.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'widgets/form_validation.dart';

class AuthScreen extends StatefulWidget {
  static String route = "/auth";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  TextEditingController emailText = TextEditingController()
    ..text = "eve.holt@reqres.in";
  TextEditingController passText = TextEditingController()..text = "cityslicka";
  bool _checkbox = false;

  // Local Auth
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  var hasButtonTriggered1 = false;
  var hasButtonTriggered2 = false;
  var hasButtonTriggered3 = false;
  final animationsMap = {
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 400.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 20),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 30.ms,
          duration: 500.ms,
          begin: const Offset(0.7, 1),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 20),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 30.ms,
          duration: 500.ms,
          begin: const Offset(0.7, 1),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'buttonOnActionTriggerAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.elasticOut,
          delay: 30.ms,
          duration: 500.ms,
          begin: const Offset(0.7, 1),
          end: const Offset(1, 1),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
    if (_authorized == "Authorized") {
      ZBotToast.showToastSuccess(message: "Successfully Logged In");
      ZBotToast.loadingClose();
      //Get.to(const MyHomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> loginDetails;
    return Scaffold(
      backgroundColor: AppColors().loginBg,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Stack(
          children: [
            Image.asset(
              AppImages().AuthBackground,
              fit: BoxFit.cover,
              alignment: const Alignment(0.12, 0),
              height: Get.height * 1.0,
              width: Get.width * 1.0,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 8.0,
                    sigmaY: 8.0), // Adjust sigmaX and sigmaY for blur intensity
                child: Container(
                  color: Colors.white.withOpacity(0.15),
                ),
              ),
            ),
            Container(
              height: Get.height,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "Feel Flow",
                    style: TextStyle(
                      color: AppColors().white,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      // Your child widget here
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 25, bottom: 20, left: 20, right: 20),
                        child: SingleChildScrollView(
                          //physics: BouncingScrollPhysics(),
                          child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Log In",
                                  style: TextStyle(
                                      color: AppColors().white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                FormFields(
                                  text: "Email",
                                  placeHolder: "Username",
                                  controller: emailText,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                FormFields(
                                  text: "Password",
                                  placeHolder: "Password",
                                  isPassword: true,
                                  controller: passText,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      child: Row(
                                        children: [
                                          Theme(
                                            data: Theme.of(context).copyWith(
                                              unselectedWidgetColor:
                                                  AppColors().white,
                                            ),
                                            child: Checkbox(
                                              activeColor: AppColors().pink,
                                              value: _checkbox,
                                              onChanged: (value) {
                                                setState(() {
                                                  _checkbox = !_checkbox;
                                                });
                                              },
                                            ),
                                          ),
                                          Text(
                                            "Remember me",
                                            style: TextStyle(
                                              color: AppColors().white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        setState(() {
                                          _checkbox = !_checkbox;
                                        });
                                      },
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        "Forgot password?",
                                        style: TextStyle(
                                          color: AppColors().pink,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      onTap: () => {
                                        // showCustomDialog(context),
                                        Forget_pass_Dialog(context),
                                      },
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          height: 20,
                                          thickness: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Text(
                                          'OR',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Expanded(
                                        child: Divider(
                                          height: 20,
                                          thickness: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                MyButton(
                                  height: 50,
                                  width: double.infinity,
                                  borderColor: Colors.white,
                                  borderRadius: 8.0,
                                  imagePath: AppImages().appleLogoWhite,
                                  buttonText: 'Log in with Apple',
                                  textColor: Colors.white,
                                  fillColor: Colors.transparent,
                                  fontSize: 15,
                                  onPressed: () async {
                                    if (animationsMap[
                                            'buttonOnActionTriggerAnimation1'] !=
                                        null) {
                                      setState(
                                          () => hasButtonTriggered1 = true);

                                      SchedulerBinding.instance
                                          .addPostFrameCallback((_) async =>
                                              await animationsMap[
                                                      'buttonOnActionTriggerAnimation1']!
                                                  .controller
                                                  .forward(from: 0.0));
                                    }
                                    // loadFunction(context);
                                    //   TransitionUtils.navigateWithAnimation(
                                    //       context, Details33ProductListingWidget());
                                  },
                                ).animateOnActionTrigger(
                                    animationsMap[
                                        'buttonOnActionTriggerAnimation1']!,
                                    hasBeenTriggered: hasButtonTriggered1),
                                SizedBox(
                                  height: 2.h,
                                ),
                                MyButton(
                                  height: 50,
                                  width: double.infinity,
                                  borderColor: Colors.white,
                                  borderRadius: 8.0,
                                  imagePath: AppImages().googleLogo,
                                  buttonText: 'Log in with Google',
                                  textColor: Colors.black,
                                  fillColor: Colors.white,
                                  fontSize: 15,
                                  onPressed: () async {
                                    if (animationsMap[
                                            'buttonOnActionTriggerAnimation2'] !=
                                        null) {
                                      setState(
                                          () => hasButtonTriggered2 = true);

                                      SchedulerBinding.instance
                                          .addPostFrameCallback((_) async =>
                                              await animationsMap[
                                                      'buttonOnActionTriggerAnimation2']!
                                                  .controller
                                                  .forward(from: 0.0));
                                    }
                                    // loadFunction(context);
                                    //   TransitionUtils.navigateWithAnimation(
                                    //       context, Details33ProductListingWidget());
                                  },
                                ).animateOnActionTrigger(
                                    animationsMap[
                                        'buttonOnActionTriggerAnimation2']!,
                                    hasBeenTriggered: hasButtonTriggered2),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Authenticate_biometric(
                                    iconData:
                                        'assets/icons/fingerprint_new.svg',
                                    authenticate: _authenticate),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  'Log In with Touch ID',
                                  style: TextStyle(
                                      color: AppColors().white, fontSize: 15),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                MyButton(
                                  height: 50,
                                  width: double.infinity,
                                  borderColor: AppColors().pink,
                                  borderRadius: 50.0,
                                  imagePath: null,
                                  buttonText: 'sign in to your account',
                                  textColor: Colors.white,
                                  fillColor: AppColors().pink,
                                  fontSize: 15,
                                  onPressed: () async {
                                    if (animationsMap[
                                            'buttonOnActionTriggerAnimation3'] !=
                                        null) {
                                      setState(
                                          () => hasButtonTriggered3 = true);

                                      SchedulerBinding.instance
                                          .addPostFrameCallback((_) async =>
                                              await animationsMap[
                                                      'buttonOnActionTriggerAnimation3']!
                                                  .controller
                                                  .forward(from: 0.0));
                                    }

                                    // login_validation(emailText.text,
                                    //     passText.text, _checkbox);
                                    // Get.off(
                                    //   () => HomePageWidget(),
                                    //   duration: Duration(milliseconds: 500),
                                    //   transition: Transition.cupertino,
                                    // );
                                    Future.delayed(Duration(milliseconds: 400),
                                        () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          transitionDuration:
                                              const Duration(milliseconds: 500),
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              HomePageWidget(),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            var begin = Offset(-1.0, 0.0);
                                            var end = Offset.zero;
                                            var curve = Curves.easeInOut;

                                            var tween =
                                                Tween(begin: begin, end: end)
                                                    .chain(
                                              CurveTween(curve: curve),
                                            );

                                            return SlideTransition(
                                              position: animation.drive(tween),
                                              child: child,
                                            );
                                          },
                                        ),
                                      );
                                    });
                                  },
                                ).animateOnActionTrigger(
                                    animationsMap[
                                        'buttonOnActionTriggerAnimation3']!,
                                    hasBeenTriggered: hasButtonTriggered3),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't Have an Account? ",
                                      style: TextStyle(
                                        color: AppColors().white,
                                        fontSize: 14,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        "Sign Up Here",
                                        style: TextStyle(
                                          color: AppColors().pink,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      onTap: () {
                                        // Your onTap logic here
                                        // showCustomDialog(context),
                                        Get.to(
                                          SignUpScreen(),
                                          duration:
                                              Duration(milliseconds: 1000),
                                          transition: Transition.cupertino,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
