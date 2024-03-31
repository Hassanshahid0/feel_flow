import 'dart:ui';

import 'package:feel_flow/src/dashboard/calander_view.dart';
import 'package:feel_flow/src/dashboard/notes.dart';
import 'package:feel_flow/src/dashboard/select_mood.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_images.dart';

import 'cutomnavbar/navbar_model.dart';
import 'widget/feel_flow_AppBar.dart';

class ChooseMoodDetail extends StatefulWidget {
  static String route = "/HomeScreen";
  const ChooseMoodDetail({Key? key}) : super(key: key);

  @override
  State<ChooseMoodDetail> createState() => ChooseMoodDetailState();
}

class ChooseMoodDetailState extends State<ChooseMoodDetail> {
  // int _currentIndex = 0;
  //final PageController _pageController = PageController();
  //final bottomNavigationBarHeight = kBottomNavigationBarHeight;
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

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> emotions = [
      {'path': AppImages().happy, 'name': 'Happy'},
      {'path': AppImages().excited, 'name': 'Excited'},
      {'path': AppImages().grateful, 'name': 'Grateful'},
      {'path': AppImages().relaxed, 'name': 'Relaxed'},
      {'path': AppImages().bored, 'name': 'Bored'},
      {'path': AppImages().unsure, 'name': 'Unsure'},
      {'path': AppImages().content, 'name': 'Content'},
      {'path': AppImages().tired, 'name': 'Tired'},
      {'path': AppImages().anxious, 'name': 'Anxious'},
      {'path': AppImages().angry, 'name': 'Angry'},
      {'path': AppImages().stressed, 'name': 'Stressed'},
      {'path': AppImages().sad, 'name': 'Sad'},
    ];

    List<Map<String, String>> sleep = [
      {'path': AppImages().sleepEarly, 'name': 'Sleep Early'},
      {'path': AppImages().sleepGood, 'name': 'Sleep Good'},
      {'path': AppImages().mediumSleep, 'name': 'Medium Sleep'},
      {'path': AppImages().badSleep, 'name': 'Bad Sleep'},
    ];

    List<Map<String, String>> food = [
      {'path': AppImages().sleepEarly, 'name': 'Eat Healthy'},
      {'path': AppImages().sleepEarly, 'name': 'Fast Food'},
      {'path': AppImages().sleepEarly, 'name': 'Homemade'},
      {'path': AppImages().sleepEarly, 'name': 'Restaurant'},
      {'path': AppImages().sleepEarly, 'name': 'Delivery'},
      {'path': AppImages().sleepEarly, 'name': 'No Meat'},
    ];

    List<Map<String, String>> moods = [
      {'path': AppImages().radMood, 'name': 'Happy'},
      {'path': AppImages().goodMood, 'name': 'Good'},
      {'path': AppImages().angryMood, 'name': 'Angry'},
      {'path': AppImages().sadMood, 'name': 'Sad'},
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
                  selectMoodFlow(
                      moods: emotions,
                      title: 'Emotions',
                      rowItems: 3,
                      pillColor: const Color(0xFFFFDB24)),
                  SizedBox(
                    height: 2.h,
                  ),
                  selectMoodFlow(
                      moods: sleep,
                      title: 'Sleep',
                      rowItems: 2,
                      pillColor: const Color(0xFFFD86E2)),
                  SizedBox(
                    height: 2.h,
                  ),
                  selectMoodFlow(
                      moods: food,
                      title: 'Food',
                      rowItems: 2,
                      pillColor: const Color(0xFFBBE935)),
                  SizedBox(
                    height: 2.h,
                  ),
                  selectMoodFlow(
                    moods: emotions,
                    title: 'Exercise',
                    rowItems: 3,
                    pillColor: const Color(0xFFFF922B),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Quick Notes",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () => {Get.to(const NotesView())},
                        child: const Text(
                          "Open full Notes",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.amber,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  CommentsBox(),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Photo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Take Photo",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 24.0,
                            semanticLabel:
                                'Text to announce in accessibility modes',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Upload Photo",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Icon(
                            Icons.upload,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Voice Memo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tap to Record",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          Icon(
                            Icons.mic,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  )
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
        backgroundColor: Colors.red,
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
        //  _dateController.text = DateFormat('EEEE, MMM dd').format(_selectedDate);
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
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
              onTap: () => _selectTime(context),
              child: AbsorbPointer(
                child: TextFormField(
                  controller: _timeController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          const Icon(
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

class ListMoodsPills extends StatefulWidget {
  final List<Map<String, String>> moods;
  final int rowItems;
  final Color pillColor; // Add pillColor parameter

  const ListMoodsPills({
    Key? key,
    required this.moods,
    required this.rowItems,
    required this.pillColor,
  }) : super(key: key);

  @override
  State<ListMoodsPills> createState() => _ListMoodsPillsState();
}

class _ListMoodsPillsState extends State<ListMoodsPills> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemWidth = constraints.maxWidth / widget.rowItems;
          final rowsCount = (widget.moods.length / widget.rowItems).ceil();
          return Container(
            // height: 120 * rowsCount.toDouble(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                rowsCount,
                (rowIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        widget.rowItems,
                        (index) {
                          final itemIndex = rowIndex * widget.rowItems + index;
                          if (itemIndex < widget.moods.length) {
                            return Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SizedBox(
                                width: itemWidth / 1.1,
                                height: 40,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: widget.pillColor,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 4),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      // mainAxisAlignment:MainAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        // Replace SvgPicture.asset with your SVG widget
                                        // Icon(Icons.star), // Just a placeholder
                                        SvgPicture.asset(
                                          widget.moods[itemIndex]['path']!,
                                          width: 20,
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Text(
                                            widget.moods[itemIndex]['name']!,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w800,
                                                fontFamily: 'proxima'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return SizedBox(width: itemWidth);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget selectMoodFlow(
    {required moods,
    required String title,
    required int rowItems,
    required Color pillColor}) {
  return Container(
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
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w800),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(
                //   Icons.add_circle_outline_outlined,
                //   color: Colors.amber,
                // ),
                // SizedBox(
                //   width: 10,
                // ),
                // Icon(
                //   Icons.arrow_circle_up_outlined,
                //   color: Colors.amber,
                // ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        ListMoodsPills(
          moods: moods,
          rowItems: rowItems,
          pillColor: pillColor,
        ),
      ]),
    ),
  );
}

class CommentsBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.black,
          // borderRadius: BorderRadius.circular(10.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(
                50.0), // You can adjust the bottom border radius here
          ),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: Get.width / 2.5, // Set the height of the TextField
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: AppColors().white),
                    decoration: const InputDecoration(
                      hintText:
                          'Add Notes...', // Placeholder text for the comment field
                      hintStyle: TextStyle(
                          color: Colors.grey), // Color of the hint text
                      border: InputBorder.none, // Border for the text field
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors
                                .black), // Color of the border when focused
                      ),
                      filled: true, // Fill the background of the TextField
                      fillColor:
                          Colors.transparent, // Transparent background color
                    ),
                    maxLines: null, // Allow multiple lines for the comment
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
