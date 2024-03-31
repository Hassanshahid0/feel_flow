import 'dart:ui';

import 'package:feel_flow/src/dashboard/calander_view.dart';
import 'package:feel_flow/src/dashboard/cutomnavbar/navbar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../resources/app_images.dart';
import 'widget/feel_flow_AppBar.dart';

class ChooseMood extends StatefulWidget {
  static String route = "/HomeScreen";
  const ChooseMood({Key? key}) : super(key: key);

  @override
  State<ChooseMood> createState() => ChooseMoodState();
}

class ChooseMoodState extends State<ChooseMood> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
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
    List<Map<String, String>> moods = [
      {'path': AppImages().radMood, 'name': 'Ras'},
      {'path': AppImages().goodMood, 'name': 'Good'},
      {'path': AppImages().angryMood, 'name': 'Angry'},
      {'path': AppImages().sadMood, 'name': 'Sad'},
      {'path': AppImages().cryingMood, 'name': 'Cry'},
    ];
    return Scaffold(
        key: scaffoldKey,
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
                    // const FeelFlow_App_Bar(),
                    SizedBox(
                      height: 12.h,
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
                          // ignore: prefer_const_constructors
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "How are you feeling?",
                                style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'proxima'),
                              ),
                              // SvgPicture.asset(
                              //   moods[1][
                              //       'path']!, // Provide the path to your SVG file
                              //   width: 40,
                              // )
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          CalendarInputField(),
                          SizedBox(
                            height: 2.h,
                          ),
                          TimeInputField(),
                          SizedBox(
                            height: 2.h,
                          ),

                          LayoutBuilder(
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
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // Image.asset(
                                          //   moods[index]['path']!,
                                          //   width: 45,
                                          // ),
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
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: Container(
                    //     height: 50,
                    //     width: Get.width / 2.4,
                    //     decoration: BoxDecoration(
                    //       color: AppColors().pink,
                    //       border: Border.all(color: AppColors().pink),
                    //       borderRadius: BorderRadius.circular(50.0),
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         TextButton(
                    //           onPressed: () async => {},
                    //           child: Text(
                    //             'Edit Moods',
                    //             style: TextStyle(
                    //                 color: AppColors().white, fontSize: 15),
                    //           ),
                    //         ),
                    //         Icon(
                    //           Icons.edit,
                    //           color: Colors.white,
                    //         )
                    //       ],
                    //     ),

                    //   ),
                    // ),

                    SizedBox(
                      height: 13.h,
                    )
                  ],
                ),
              ),
            ), // Place app bar at the top
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
                      backgroundColor: Color(0xFF3F9FF5),
                      onPressed: () {
                        Get.to(ChooseMood());
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50.0), // Adjust the value as needed
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            16.0), // Adjust padding as needed
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
                          fontSize: 16),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFFEC8E07),
                              onPressed: () {
                                Get.to(ChooseMood());
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    50.0), // Adjust the value as needed
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child:
                                    SvgPicture.asset('assets/icons/arrow.svg'),
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
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(width: Get.width / 4),
                        Column(
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFFFF2524),
                              onPressed: () {
                                Get.to(CalanderView());
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    50.0), // Adjust the value as needed
                              ),
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
                                  fontSize: 16),
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
        bottomNavigationBar: CustomNavbarWidget());
  }
}

class CalendarInputField extends StatefulWidget {
  @override
  _CalendarInputFieldState createState() => _CalendarInputFieldState();
}

class _CalendarInputFieldState extends State<CalendarInputField> {
  TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // _dateController.text = DateFormat('EEEE, MMM dd').format(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _dateController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          const Icon(
            Icons.calendar_month_outlined,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        //_dateController.text = DateFormat('EEEE, MMM dd').format(_selectedDate);
      });
    }
  }
}

class TimeInputField extends StatefulWidget {
  @override
  _TimeInputFieldState createState() => _TimeInputFieldState();
}

class _TimeInputFieldState extends State<TimeInputField> {
  late TextEditingController _timeController;
  late TimeOfDay _selectedTime;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _timeController = TextEditingController();
    _selectedTime = TimeOfDay.now();
    _timeController.text = _selectedTime.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => _selectTime(context),
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _timeController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Icon(
            Icons.access_time,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = _selectedTime.format(context);
      });
    }
  }

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }
}
