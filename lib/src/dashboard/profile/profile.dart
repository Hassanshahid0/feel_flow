import 'dart:ui';

import 'package:feel_flow/src/dashboard/profile/Custom_Display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_images.dart';
import '../../auth_view/widgets/button1.dart';
//import '../notes.dart';
import '../widget/feel_flow_AppBar.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileView extends StatefulWidget {
  static String route = "/profile";
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  bool isCreateAnnouncementPressed = false;

  void _onScroll() {
    print("Hello");
    if (_scrollController.offset > 10) {
      setState(() {
        _isScrolled = true;
      });
    } else {
      setState(() {
        _isScrolled = false;
      });
    }
  }

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
    _scrollController.addListener(_onScroll);

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
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Set background color to transparent
      appBar: FeelFlow_App_Bar(
        isScrolled: _isScrolled,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
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
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Container(
                color: Colors.white.withOpacity(0.15),
              ),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // const FeelFlow_App_Bar(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const ProfileCircularImage(
                    imageUrl:
                        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  cstCustomInput(defaultText: 'Joel'),
                  cstCustomInput(defaultText: 'Male'),
                  cstCustomInput(defaultText: '10-12-1999'),
                  cstCustomInput(defaultText: 'United States'),
                  cstCustomInput(defaultText: 'Dallas'),
                  SizedBox(
                    height: 2.h,
                  ),
                  MyButton(
                    height: 45,
                    width: double.infinity,
                    borderColor: AppColors().pink,
                    borderRadius: 50.0,
                    imagePath: null,
                    buttonText: 'Save',
                    textColor: AppColors().white,
                    fillColor: AppColors().pink,
                    fontSize: 15,
                    onPressed: () async {
                      if (animationsMap['buttonOnActionTriggerAnimation1'] !=
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
                      animationsMap['buttonOnActionTriggerAnimation1']!,
                      hasBeenTriggered: hasButtonTriggered1),

                  SizedBox(
                    height: 2.h,
                  ),
                  MyButton(
                    height: 45,
                    width: double.infinity,
                    borderColor: AppColors().pink,
                    borderRadius: 50.0,
                    imagePath: null,
                    buttonText: 'cancel',
                    textColor: AppColors().white,
                    fillColor: Colors.transparent,
                    fontSize: 15,
                    onPressed: () async {
                      if (animationsMap['buttonOnActionTriggerAnimation2'] !=
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
                      animationsMap['buttonOnActionTriggerAnimation2']!,
                      hasBeenTriggered: hasButtonTriggered2),

                  SizedBox(
                    height: 2.h,
                  ),

                  MyButton(
                    height: 45,
                    width: double.infinity,
                    borderColor: AppColors().yellow,
                    borderRadius: 50.0,
                    imagePath: null,
                    buttonText: 'Deactivate Your Account',
                    textColor: Colors.white,
                    fillColor: AppColors().yellow,
                    fontSize: 15,
                    onPressed: () async {
                      if (animationsMap['buttonOnActionTriggerAnimation3'] !=
                          null) {
                        setState(() => hasButtonTriggered3 = true);

                        SchedulerBinding.instance.addPostFrameCallback(
                            (_) async => await animationsMap[
                                    'buttonOnActionTriggerAnimation3']!
                                .controller
                                .forward(from: 0.0));
                      }

                      //   TransitionUtils.navigateWithAnimation(
                      //       context, Details33ProductListingWidget());
                    },
                  ).animateOnActionTrigger(
                      animationsMap['buttonOnActionTriggerAnimation3']!,
                      hasBeenTriggered: hasButtonTriggered3),
                  SizedBox(
                    height: 13.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileCircularImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onPressedEdit;

  const ProfileCircularImage({
    Key? key,
    required this.imageUrl,
    this.onPressedEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(imageUrl),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: SizedBox(
              width: 30, // Adjust the width as needed
              height: 30, // Adjust the height as needed
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors().yellow,
                ),
                child: IconButton(
                  onPressed: onPressedEdit,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  iconSize: 15, // Adjust the icon size as needed
                ),
              ),
            )),
      ],
    );
  }
}
