import 'dart:ui';

import 'package:feel_flow/src/dashboard/cutomnavbar/navbar_model.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import '../../../flutter_flow/flutter_flow_model.dart';
import 'package:flutter/material.dart';
import '../../../resources/app_images.dart';
import '../../auth_view/widgets/custom_container.dart';
import '../calander_view.dart';
export 'home.dart';
import 'package:get/get.dart';

import '../select_mood.dart';
import '../select_mood_detail.dart';

class HomePageWidget extends StatefulWidget {
  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late CustomNavbarModel customNavbarModel;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    customNavbarModel = createModel(context, () => CustomNavbarModel());
  }

  bool _isScrolled = false;
  bool isCreateAnnouncementPressed = false;
  final ScrollController _scrollController = ScrollController();
  void _onScroll() {
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

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> moods = [
      {'path': AppImages().radMood, 'name': 'Rad'},
      {'path': AppImages().goodMood, 'name': 'Good'},
      {'path': AppImages().angryMood, 'name': 'Angry'},
      {'path': AppImages().sadMood, 'name': 'Sad'},
      {'path': AppImages().cryingMood, 'name': 'Cry'},
    ];

    final List<SvgPicture> svgIcons = [
      SvgPicture.asset('assets/icons/entries.svg'),
      SvgPicture.asset('assets/icons/stats.svg'),
      SvgPicture.asset('assets/icons/calander.svg'),
      SvgPicture.asset('assets/icons/more.svg'),
    ];
    return Stack(
      children: [
        Align(
          alignment: const AlignmentDirectional(0, -1.25),
          child: Image.asset(
            AppImages().AuthBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          key: scaffoldKey,
          // endDrawer: cstDrawer(),
          backgroundColor: const Color.fromARGB(94, 244, 67, 54),
          extendBodyBehindAppBar: true,
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFFEA3453),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: CustomNavbarWidget(),
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
                      // const FeelFlow_App_Bar(),
                      SizedBox(
                        height: 8.h,
                      ),
                      //TriangleWidget(),
                      //RectanglePainter(),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0), // Add more space at the top
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.27,
                              //180, // Increased height to accommodate the additional space
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(
                                0.0, -30.0), // Offset to move the Row up
                            // child: const Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: <Widget>[
                            //     Icon(
                            //       Icons.waving_hand,
                            //       color: Colors.amber,
                            //       size: 25,
                            //     ),
                            //     Text(
                            //       'Hello Joe',
                            //       style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 18,
                            //           fontFamily: 'yellowtail',
                            //           fontStyle: FontStyle
                            //               .italic), // Add fontStyle property
                            //     ),
                            //   ],
                            // ),
                          ),
                          const Positioned(
                            top: 20, // Position the first text
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.waving_hand,
                                  color: Colors.amber,
                                  size: 25,
                                ),
                                Text(
                                  'Hello Joe',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'yellowtail',
                                      fontStyle: FontStyle
                                          .italic), // Add fontStyle property
                                ),
                              ],
                            ),
                          ),
                          const Positioned(
                            top: 60, // Position the first text
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                'How Are you feeling today?',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          // Positioned(
                          //   top: 80, // Position the second text
                          //   left: 0,
                          //   right: 0,
                          //   child: Center(
                          //     child: LayoutBuilder(
                          //       builder: (context, constraints) {
                          //         final itemWidth =
                          //             constraints.maxWidth / moods.length;
                          //         return Container(
                          //           height: 120,
                          //           child: ListView.builder(
                          //             scrollDirection: Axis.horizontal,
                          //             itemCount: moods.length,
                          //             itemBuilder: (context, index) {
                          //               return SizedBox(
                          //                 width: itemWidth,
                          //                 child: Column(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.center,
                          //                   children: [
                          //                     // Image.asset(
                          //                     //   moods[index]['path']!,
                          //                     //   width: 45,
                          //                     // ),
                          //                     SvgPicture.asset(
                          //                       moods[index][
                          //                           'path']!, // Provide the path to your SVG file
                          //                       width: 37,
                          //                     ),

                          //                     SizedBox(
                          //                       height: 1.h,
                          //                     ),
                          //                     Text(
                          //                       moods[index]['name']!,
                          //                       style: const TextStyle(
                          //                           color: Colors.white,
                          //                           fontSize: 16),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               );
                          //             },
                          //           ),
                          //         );
                          //       },
                          //     ),
                          //   ),
                          // ),
                          Positioned(
                            top: 80, // Position the second text
                            left: 0,
                            right: 0,
                            child: Center(
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  final itemWidth =
                                      constraints.maxWidth / moods.length;
                                  return Container(
                                    height: 120,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: moods.length,
                                      itemBuilder: (context, index) {
                                        return SizedBox(
                                          width: itemWidth,
                                          child: GestureDetector(
                                            onTap: () {
                                              print("Item $index tapped.");
                                              Get.to(
                                                const ChooseMoodDetail(),
                                                duration: const Duration(
                                                    milliseconds: 50),
                                                transition:
                                                    Transition.cupertino,
                                              );
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  moods[index][
                                                      'path']!, // Provide the path to your SVG file
                                                  width: 37,
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Text(
                                                  moods[index]['name']!,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "7 days since last entry",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      for (var i = 0; i < 5; i++) ...{
                        SizedBox(
                          height: 2.h,
                        ),
                        const CustomContainerWidget(
                          date: 'Saturday',
                          month: 'March',
                          year: '24',
                          //moodImagePath: 'Rs',
                          mood: 'Good',
                          time: '10:30 AM',
                          amPm: 'AM',
                        ),
                      },
                    ],
                  ),
                ),
              ),
              if (isCreateAnnouncementPressed) ...[
                Container(
                  color:
                      Colors.black.withOpacity(0.5), // Adjust opacity as needed
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
                                  child: SvgPicture.asset(
                                      'assets/icons/arrow.svg'),
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

              // Place app bar at the top
            ],
          ),
        ),
      ],
    );
  }
}
