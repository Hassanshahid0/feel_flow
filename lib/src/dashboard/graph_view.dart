import 'dart:ui';

// import 'package:feel_flow/src/dashboard/calander_view.dart';
//import 'package:feel_flow/src/dashboard/select_mood.dart';
// import 'package:feel_flow/src/dashboard/widgets/allMoods.dart';
// import 'package:feel_flow/src/dashboard/widgets/bottomNavigaion.dart';
// import 'package:feel_flow/src/dashboard/widgets/cst_drawer.dart';
// import 'package:feel_flow/src/dashboard/widgets/feel_flow_AppBar.dart';
import 'package:feel_flow/src/dashboard/cutomnavbar/navbar_model.dart';
import 'package:feel_flow/src/dashboard/select_mood.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import '../../resources/app_images.dart';
import 'package:pie_chart/pie_chart.dart';

import 'calander_view.dart';

class GraphView extends StatefulWidget {
  static String route = "/HomeScreen";
  const GraphView({Key? key}) : super(key: key);

  @override
  State<GraphView> createState() => GraphViewState();
}

class GraphViewState extends State<GraphView> {
  final bottomNavigationBarHeight = kBottomNavigationBarHeight;
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  bool isCreateAnnouncementPressed = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Positive": 60,
      "Negative": 10,
      "Excited": 20,
    };

    List<Map<String, String>> moods = [
      {'path': AppImages().radMood, 'name': 'Mon'},
      {'path': AppImages().goodMood, 'name': 'Tue'},
      {'path': AppImages().addMood, 'name': 'Add'},
      {'path': AppImages().sadMood, 'name': 'Thur'},
      {'path': AppImages().cryingMood, 'name': 'Fri'},
    ];

    return Scaffold(
      key: scaffoldKey,
      //endDrawer: cstDrawer(),
      backgroundColor:
          Colors.transparent, // Set background color to transparent
      // appBar: FeelFlow_App_Bar(
      //   isScrolled: _isScrolled,
      // ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // const FeelFlow_App_Bar(),
                  SizedBox(
                    height: 8.h,
                  ),
                  // TriangleWidget(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: double.infinity,
                    // height: 280,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(children: [
                        // How are you Feeling
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Mood Chart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800),
                            ),
                            DropdownWidget(),
                          ],
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        // PieChart(
                        //   dataMap: dataMap,
                        //   animationDuration: const Duration(milliseconds: 800),
                        //   chartLegendSpacing: 4.h,
                        //   colorList: const [
                        //     Colors.green, // Positive
                        //     Colors.red, // Negative
                        //     Colors.amber, // Excited
                        //   ],
                        //   chartRadius: MediaQuery.of(context).size.width / 3.2,
                        //   initialAngleInDegree: 0,
                        //   chartType: ChartType.ring,
                        //   ringStrokeWidth: 32,
                        //   centerText: "Moods",
                        //   legendOptions: const LegendOptions(
                        //     showLegendsInRow: false,
                        //     legendPosition: LegendPosition.right,
                        //     showLegends: true,
                        //     legendTextStyle: TextStyle(
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        //   chartValuesOptions: const ChartValuesOptions(
                        //     showChartValueBackground: true,
                        //     showChartValues: true,
                        //     showChartValuesInPercentage: false,
                        //     showChartValuesOutside: true,
                        //     decimalPlaces: 1,
                        //   ),
                        // ),

                        // Generated code for this Row Widget...
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12, 0, 12, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.04,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF955905),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.04,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.03,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFED8D06),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.04,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF955905),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.04,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.07,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFED8D06),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.04,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF955905),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.04,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.085,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFED8D06),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.04,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF955905),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.04,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.142,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFED8D06),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.04,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF955905),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.04,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.117,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFED8D06),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.04,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF742601),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.04,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.04,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFFF5100),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.04,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF742601),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.04,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.095,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFFF5100),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.04,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF742601),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.04,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.065,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFFF5100),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.04,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF72814D),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.04,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.12,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF9CB165),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.04,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF72814D),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.04,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.065,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF9CB165),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.04,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.2,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF72814D),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.04,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.14,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF9CB165),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          alignment:
                                              const AlignmentDirectional(0, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const RangeSliderExample(),
                        // Generated code for this Row Widget...
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '02 Feb',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0,
                                ),
                              ),
                              Text(
                                '15 Feb',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 5, 0),
                                  child: Icon(
                                    Icons.circle,
                                    color: Color(0xFF9CB165),
                                    size: 12,
                                  ),
                                ),
                                Text(
                                  'Positive',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 4.5.h,
                            ),
                            const Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 5, 0),
                                  child: Icon(
                                    Icons.circle,
                                    color: Color(0xFFFF5100),
                                    size: 12,
                                  ),
                                ),
                                Text(
                                  'Negative',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 4.5.h,
                            ),
                            const Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 5, 0),
                                  child: Icon(
                                    Icons.circle_sharp,
                                    color: Color(0xFFED8D06),
                                    size: 12,
                                  ),
                                ),
                                Text(
                                  'Excited',
                                  style: TextStyle(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: double.infinity,
                    // height: 280,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Days in a row",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            const Icon(
                              Icons.more_vert,
                              size: 28,
                              color: Colors.amber,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0; i <= 4; i++) ...{
                                GestureDetector(
                                  onTap: () {
                                    // Add your
                                    if (i == 2) {
                                      print('Icon at index $i pressed');
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    moods[i][
                                        'path']!, // Provide the path to your SVG file
                                    width: 40,
                                  ),
                                ),
                              }
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rad",
                                style: TextStyle(
                                    color: Colors
                                        .white), // Correct syntax for specifying text color
                              ),
                              Text(
                                "good",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Add",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Sad",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Cry",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ), // Place app bar at the top
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
                      Get.off(const ChooseMood());
                    },
                    shape: const CircleBorder(),
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
                              Get.off(const ChooseMood());
                            },
                            shape: const CircleBorder(),
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
                              Get.off(const CalanderView());
                            },
                            shape: const CircleBorder(),
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
    );
  }
}

class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String? dropdownValue;
  List<String> items = ['Weekly', 'Monthly', '6 Months', 'Yearly'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 0.0), // Adjust padding as needed
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            color: Colors.white,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: DropdownButton<String>(
            isDense: true,
            value: dropdownValue,
            hint: const Text(
              'Select Time',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white, // Change arrow icon color here
            ),
            iconSize: 24,
            // elevation: 16,
            style: const TextStyle(
                color: Colors.black), // Dropdown menu item color
            underline: Container(
              height: 2,
              color: Colors.transparent,
            ),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return items.map<Widget>((String value) {
                return Center(
                  child: Text(
                    value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18), // Selected item color
                  ),
                );
              }).toList();
            },
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15), // Dropdown menu item color
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class RangeSliderExample extends StatefulWidget {
  const RangeSliderExample({super.key});

  @override
  State<RangeSliderExample> createState() => _RangeSliderExampleState();
}

class _RangeSliderExampleState extends State<RangeSliderExample> {
  RangeValues _currentRangeValues = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        trackHeight: 1.0, // Adjust the thickness of the slider track
        thumbColor: Colors.red,
      ),
      child: Container(
        child: RangeSlider(
          values: _currentRangeValues,
          max: 100,
          divisions: 5,
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          activeColor: Color.fromARGB(134, 158, 158,
              158), // Set the color of the active part of the slider
          inactiveColor:
              Colors.black, // Set the color of the inactive part of the slider

          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),
      ),
    );
  }
}
