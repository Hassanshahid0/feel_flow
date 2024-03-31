import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../resources/app_images.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';

import 'package:intl/intl.dart' show DateFormat;

import 'cutomnavbar/navbar_model.dart';
import 'select_mood.dart';
import 'widget/cst_drawer.dart';
import 'widget/feel_flow_AppBar.dart';

class CalanderView extends StatefulWidget {
  static String route = "/HomeScreen";
  const CalanderView({Key? key}) : super(key: key);

  @override
  State<CalanderView> createState() => CalanderViewState();
}

class CalanderViewState extends State<CalanderView> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final bottomNavigationBarHeight = kBottomNavigationBarHeight;
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  bool isCreateAnnouncementPressed = false;
  DateTime _currentDate = DateTime(2019, 2, 3);
  DateTime _currentDate2 = DateTime(2019, 2, 3);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  DateTime _targetDateTime = DateTime(2019, 2, 3);

  int counter = 5;
  Timer? timer;

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (counter == 0) {
          timer.cancel();
        } else {
          setState(() {
            counter--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    DateTime _currentDate = DateTime(2019, 2, 3);
    DateTime _currentDate2 = DateTime(2019, 2, 3);
    String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
    DateTime _targetDateTime = DateTime(2019, 2, 3);
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
      onDayPressed: (date, events) {
        setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: const TextStyle(
        color: Colors.white,
      ),
      daysTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
      height: MediaQuery.of(context).size.height * 0.3,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: const NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder: const CircleBorder(
          side: BorderSide(color: Color.fromARGB(255, 236, 6, 6))),
      markedDateCustomTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: const TextStyle(
        color: Colors.blue,
      ),
      todayButtonColor: Colors.yellow,
      selectedDayTextStyle: const TextStyle(
        color: Colors.yellow,
      ),
      weekdayTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
      maxSelectedDate: _currentDate.add(const Duration(days: 360)),
      prevDaysTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.pinkAccent,
      ),
      inactiveDaysTextStyle: const TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return Scaffold(
      key: scaffoldKey,
      endDrawer: cstDrawer(),
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
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
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
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Calendar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.calendar_month_sharp,
                                color: Colors.amber,
                                weight: 50,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),

                          // Generated code for this Row Widget...

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () {
                                          setState(() {
                                            _targetDateTime = DateTime(
                                                _targetDateTime.year,
                                                _targetDateTime.month - 1);
                                            _currentMonth = DateFormat.yMMM()
                                                .format(_targetDateTime);
                                          });
                                        },
                                        child: const FaIcon(
                                          FontAwesomeIcons.caretSquareLeft,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      Text(
                                        _currentMonth,
                                        style: TextStyle(
                                            fontFamily: 'Yellowtail',
                                            fontSize: 25,
                                            color: Colors.white),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            _targetDateTime = DateTime(
                                                _targetDateTime.year,
                                                _targetDateTime.month + 1);
                                            _currentMonth = DateFormat.yMMM()
                                                .format(_targetDateTime);
                                          });
                                        },
                                        child: const FaIcon(
                                          FontAwesomeIcons.caretSquareRight,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: _calendarCarouselNoHeader,
                              ), //
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          // Generated code for this Row Widget...
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 5, 0),
                                    child: Icon(
                                      Icons.circle,
                                      color: Color(0xFF9CB165),
                                      size: 15,
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
                                width: 5.h,
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
                                      size: 15,
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
                                width: 5.h,
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
                                      size: 15,
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

                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
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
                      child: Column(
                        children: [
                          // How are you Feeling
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mood Count",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800),
                              ),
                              Icon(
                                Icons.swipe_right_sharp,
                                color: Colors.amber,
                                weight: 50,
                              ),
                            ],
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Tap on mood to see more",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),

                          Center(
                            child: Stack(
                              // stack widget that set it child one over the another.
                              children: [
                                // first child

                                Container(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                      onTap: () {
                                        startTimer();
                                      },
                                      child: Image.asset(
                                        AppImages().counterIcon,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                2,
                                      ),
                                    )),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  right: 0,
                                  left: 0,
                                  child: Container(
                                    //second child
                                    alignment: Alignment.center,

                                    // onTap: () {
                                    //   startTimer();
                                    // },
                                    child: Text(
                                      '$counter',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 35.0,
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
                  ),
                  SizedBox(
                    height: 13.h,
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
