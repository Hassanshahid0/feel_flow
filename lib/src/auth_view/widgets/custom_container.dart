import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package
import 'package:sizer/sizer.dart';
import '../../../resources/app_images.dart'; // Import the AppImages class

class CustomContainerWidget extends StatelessWidget {
  final String? date;
  final String? month;
  final String? year;
  final String? mood; // Remove moodImagePath
  final String? time;
  final String? amPm;

  const CustomContainerWidget({
    Key? key,
    this.date,
    this.month,
    this.year,
    this.mood, // Remove moodImagePath
    this.time,
    this.amPm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> cstmoods = {
      'Ras': AppImages().radMood,
      'Good': AppImages().goodMood,
      'Angry': AppImages().angryMood,
      'Sad': AppImages().sadMood,
      'Cry': AppImages().cryingMood,
      // Add more moods as needed
    };
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.125,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 10, 0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.10,
                    height: MediaQuery.of(context).size.width * 0.10,

                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      cstmoods['Good']!,
                      // width: 60,
                    ), // Display moodImage or empty Container
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5, 10, 0, 0),
                      child: Text(
                        '${date ?? ''} ${month ?? ''} ${year ?? ''}, ${time ?? ''} ',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          color: const Color(0xFFAEAEAE),
                          fontSize: 10,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: Colors.amber,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Row(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: Text(
                          '${mood ?? ''}',
                          style: TextStyle(
                              fontFamily: 'Yellowtail',
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              color: Colors.amber[800]),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  child: Row(
                    children: [
                      MoodCategory(context: context, Mood: "Tired"),
                      SizedBox(
                        width: 2.h,
                      ),
                      MoodCategory(context: context, Mood: "Medium Sleep"),
                      SizedBox(
                        width: 2.h,
                      ),
                      MoodCategory(context: context, Mood: "Eat Healthy")
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget MoodCategory({required BuildContext context, required String Mood}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        AppImages().tiredMood,
        width: 15,
      ),
      SizedBox(
        height: 2.h,
      ),
      Text(
        Mood,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    ],
  );
}
