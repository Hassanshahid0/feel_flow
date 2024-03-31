import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_images.dart';
import '../auth_view/widgets/button1.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'calander_view.dart';
import 'cutomnavbar/navbar_model.dart';
import 'select_mood.dart';
import 'widget/feel_flow_AppBar.dart';

class NotesView extends StatefulWidget {
  static String route = "/profile";
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> with TickerProviderStateMixin {
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
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  CommentsBox(),
                  SizedBox(
                    height: 3.h,
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     MyButton(
                  //       height: 45,
                  //       width: Get.width / 2.4,
                  //       borderColor: AppColors().pink,
                  //       borderRadius: 50.0,
                  //       imagePath: null,
                  //       buttonText: 'Choose Template',
                  //       textColor: AppColors().white,
                  //       fillColor: AppColors().pink,
                  //       fontSize: 15,
                  //       onPressed: () async {
                  //         if (animationsMap[
                  //                 'buttonOnActionTriggerAnimation1'] !=
                  //             null) {
                  //           setState(() => hasButtonTriggered1 = true);

                  //           SchedulerBinding.instance.addPostFrameCallback(
                  //               (_) async => await animationsMap[
                  //                       'buttonOnActionTriggerAnimation1']!
                  //                   .controller
                  //                   .forward(from: 0.0));
                  //         }
                  //         // loadFunction(context);
                  //         //   TransitionUtils.navigateWithAnimation(
                  //         //       context, Details33ProductListingWidget());
                  //       },
                  //     ).animateOnActionTrigger(
                  //         animationsMap['buttonOnActionTriggerAnimation1']!,
                  //         hasBeenTriggered: hasButtonTriggered1),
                  //     MyButton(
                  //       height: 45,
                  //       width: Get.width / 2.4,
                  //       borderColor: AppColors().pink,
                  //       borderRadius: 50.0,
                  //       imagePath: null,
                  //       buttonText: 'Choose Font',
                  //       textColor: AppColors().white,
                  //       fillColor: Colors.transparent,
                  //       fontSize: 15,
                  //       onPressed: () async {
                  //         if (animationsMap[
                  //                 'buttonOnActionTriggerAnimation2'] !=
                  //             null) {
                  //           setState(() => hasButtonTriggered2 = true);

                  //           SchedulerBinding.instance.addPostFrameCallback(
                  //               (_) async => await animationsMap[
                  //                       'buttonOnActionTriggerAnimation2']!
                  //                   .controller
                  //                   .forward(from: 0.0));
                  //         }
                  //         // loadFunction(context);
                  //         //   TransitionUtils.navigateWithAnimation(
                  //         //       context, Details33ProductListingWidget());
                  //       },
                  //     ).animateOnActionTrigger(
                  //         animationsMap['buttonOnActionTriggerAnimation2']!,
                  //         hasBeenTriggered: hasButtonTriggered2),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          if (isCreateAnnouncementPressed) ...[
            Container(
              color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              width: Get.width,
              bottom: 130,
              child: Column(
                children: [
                  FloatingActionButton(
                    backgroundColor: const Color(0xFF3F9FF5),
                    heroTag: "btn1",
                    onPressed: () {
                      // Handle onPressed event
                      Get.off(ChooseMood());
                    },
                    shape: CircleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset('assets/icons/clock.svg'),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Today",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          FloatingActionButton(
                            backgroundColor: const Color(0xFFEC8E07),
                            heroTag: "btn2",
                            onPressed: () {
                              // Handle onPressed event
                              Get.off(ChooseMood());
                            },
                            shape: CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset('assets/icons/arrow.svg'),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Yesterday",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: Get.width / 4),
                      Column(
                        children: [
                          FloatingActionButton(
                            backgroundColor: const Color(0xFFFF2524),
                            heroTag: "btn3",
                            onPressed: () {
                              // Handle onPressed event
                              Get.off(CalanderView());
                            },
                            shape: CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                  'assets/icons/calander2.svg'),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            "Other Day",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFEA3453),
        onPressed: () {
          setState(() {
            isCreateAnnouncementPressed = !isCreateAnnouncementPressed;
          });
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          isCreateAnnouncementPressed == false ? Icons.add : Icons.close,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavbarWidget(),
    );
  }
}

// class CommentsBox extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.all(20.0),
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Container(
//               height: Get.height / 1.9, // Set the height of the TextField
//               child: Column(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Note",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                   TextFormField(
//                     style: TextStyle(color: AppColors().white),
//                     decoration: const InputDecoration(
//                       hintText:
//                           'Add Notes...', // Placeholder text for the comment field
//                       hintStyle: TextStyle(
//                           color: Colors.grey), // Color of the hint text
//                       border: InputBorder.none, // Border for the text field
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Colors
//                                 .black), // Color of the border when focused
//                       ),
//                       filled: true, // Fill the background of the TextField
//                       fillColor:
//                           Colors.transparent, // Transparent background color
//                     ),
//                     maxLines: 10, // Allow multiple lines for the comment
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }

class CommentsBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 1.9,
            color: Colors.transparent,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Note",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Add Notes...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  maxLines: 12,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // Handle the onTap event
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset('assets/icons/delete.svg'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle the onTap event
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.amber,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
