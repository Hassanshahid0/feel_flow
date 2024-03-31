import 'dart:math';
import 'dart:ui';

import 'package:feel_flow/src/auth_view/auth_screen.dart';
import 'package:feel_flow/src/auth_view/widgets/forget_pass.dart';
import 'package:feel_flow/src/auth_view/widgets/form_field.dart';
import 'package:feel_flow/src/auth_view/widgets/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sizer/sizer.dart';
import '../../flutter_flow/flutter_flow.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';
import 'dart:async';

import '../../utils/zbotToast.dart';
import 'widgets/button1.dart';
//import '../dashboard/home_page.dart';

class SignUpScreen extends StatefulWidget {
  static String route = "/auth";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen>
    with TickerProviderStateMixin {
  TextEditingController emailText = TextEditingController();
  TextEditingController passText = TextEditingController();
  bool _checkbox = false;

  // Local Auth
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  List<BiometricType>? _availableBiometrics;
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
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
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

    List<String> countries = [
      'USA',
      'Canada',
      'Mexico',
      'Brazil',
      'India',
      'China',
      'Japan',
      'Germany',
      'France',
      'UK',
      'Australia',
      'South Africa',
    ];

    List<String> cities = [
      'New York',
      'Los Angeles',
      'Chicago',
      'Houston',
      'Phoenix',
      'Philadelphia',
      'San Antonio',
      'San Diego',
      'Dallas',
      'San Jose',
      'Austin',
      'Jacksonville',
    ];

    return Scaffold(
      backgroundColor: AppColors().loginBg,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Stack(
          children: [
            Image.asset(
              AppImages().AuthBackground,
              fit: BoxFit.cover,
              alignment:
                  const Alignment(0.12, 0), // Move image slightly to the left
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
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
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
                            top: 15, bottom: 20, left: 20, right: 20),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(children: [
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: AppColors().white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            FormFields(
                              text: "Email",
                              placeHolder: "First Name",
                              controller: emailText,
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            FormFields(
                              text: "Email",
                              placeHolder: "Last Name",
                              controller: emailText,
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            FormFields(
                              text: "Email",
                              placeHolder: "Email",
                              controller: emailText,
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            CustomDropdown(
                              items: countries,
                              placeholder: 'Country',
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            CustomDropdown(
                              items: cities,
                              placeholder: 'City',
                            ),
                            SizedBox(
                              height: 0.8.h,
                            ),
                            FormFields(
                              text: "Password",
                              placeHolder: "Password",
                              isPassword: true,
                              controller: passText,
                            ),
                            SizedBox(
                              height: 1.2.h,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Text(
                                      'OR',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
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
                              height: 1.2.h,
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
                              fontSize: 16,
                              onPressed: () async {
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation2'] !=
                                    null) {
                                  setState(() => hasButtonTriggered2 = true);

                                  SchedulerBinding.instance.addPostFrameCallback(
                                      (_) async => await animationsMap[
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
                              height: 1.2.h,
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
                              fontSize: 16,
                              onPressed: () async {
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation1'] !=
                                    null) {
                                  setState(() => hasButtonTriggered1 = true);

                                  SchedulerBinding.instance.addPostFrameCallback(
                                      (_) async => await animationsMap[
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
                              height: 1.2.h,
                            ),
                            MyButton(
                              height: 50,
                              width: double.infinity,
                              borderColor: AppColors().pink,
                              borderRadius: 50.0,
                              imagePath: null,
                              buttonText: ' create an Account',
                              textColor: Colors.white,
                              fillColor: AppColors().pink,
                              fontSize: 16,
                              onPressed: () async {
                                if (animationsMap[
                                        'buttonOnActionTriggerAnimation3'] !=
                                    null) {
                                  setState(() => hasButtonTriggered3 = true);

                                  SchedulerBinding.instance.addPostFrameCallback(
                                      (_) async => await animationsMap[
                                              'buttonOnActionTriggerAnimation3']!
                                          .controller
                                          .forward(from: 0.0));
                                }
                                // loadFunction(context);
                                //   TransitionUtils.navigateWithAnimation(
                                //       context, Details33ProductListingWidget());
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
                                  "Already Have an Account? ",
                                  style: TextStyle(
                                    color: AppColors().white,
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    "Log In Here",
                                    style: TextStyle(
                                      color: AppColors().pink,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () {
                                    // Your onTap logic here
                                    // showCustomDialog(context),
                                    Get.to(
                                      const AuthScreen(),
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      transition: Transition.cupertino,
                                    );
                                  },
                                ),
                              ],
                            )
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

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String placeholder;

  CustomDropdown({required this.items, required this.placeholder});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 2.0, // Adjust the thickness as needed
          ),
        ),
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          border: InputBorder.none, // Remove the default border
        ),
        style: const TextStyle(color: Colors.white, fontSize: 18),
        items: widget.items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                color: Colors.black, // Text color in dropdown
                fontWeight: FontWeight.normal, // Reset font weight
              ),
            ),
          );
        }).toList(),
        selectedItemBuilder: (BuildContext context) {
          return widget.items.map<Widget>((String item) {
            return Text(
              item,
              style: const TextStyle(
                color: Colors.white, // Selected item text color
                fontSize: 18,
              ),
            );
          }).toList();
        },
        onChanged: (String? value) {
          setState(() {
            _selectedItem = value;
          });
          // Handle dropdown value change
        },
        value: _selectedItem,
        hint: Text(
          widget.placeholder,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
