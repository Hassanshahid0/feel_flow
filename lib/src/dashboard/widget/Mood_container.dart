import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/app_images.dart';

// Your other imports...

class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromWindow(WidgetsBinding.instance!.window),
      child: Scaffold(
        body: YourBodyWidget(),
      ),
    );
  }
}

class YourBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoodCardFull(
          context: context,
          Date: "Your date",
          Time: "Your time",
          Mood: "Your mood",
        ),
        MoodCard(
          context: context,
          Date: "Your date",
          Time: "Your time",
          Mood: "Your mood",
        ),
      ],
    );
  }
}

Widget MoodCardFull({
  required BuildContext context,
  required String Date,
  required String Time,
  required String Mood,
}) {
  Map<String, String> cstmoods = {
    'Ras': AppImages().radMood,
    'Good': AppImages().goodMood,
    'Angry': AppImages().angryMood,
    'Sad': AppImages().sadMood,
    'Cry': AppImages().cryingMood,
    // Add more moods as needed
  };

  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20.0),
    ),
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                cstmoods['${Mood}']!,
                width: 40,
              ),
              SizedBox(
                width: 2.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      Date,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        Mood,
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 25,
                          fontFamily: 'yellowtail',
                        ),
                      ),
                      SizedBox(
                        width: 1.h,
                      ),
                      Text(
                        Time,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MoodCategory(context: context, Mood: "Tired"),
                      SizedBox(
                        width: 1.h,
                      ),
                      MoodCategory(context: context, Mood: "Med Sleep"),
                      SizedBox(
                        width: 1.h,
                      ),
                      MoodCategory(context: context, Mood: "Eat Healthy")
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.more_vert,
            color: Colors.amber,
          ),
        ],
      ),
    ),
  );
}

Widget MoodCard({
  required BuildContext context,
  required String Date,
  required String Time,
  required String Mood,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20.0),
    ),
    height: 250,
    width: MediaQuery.of(context).size.width / 2.3,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Date,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    Time,
                    style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Icon(
                Icons.more_vert,
                color: Colors.amber,
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Image.asset(
            AppImages().happyMood,
            width: 80,
          ),
          Text(
            Mood,
            style: const TextStyle(color: Colors.white, fontSize: 25),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MoodCategory(context: context, Mood: "Tired"),
              MoodCategory(context: context, Mood: "Med Sleep")
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MoodCategory(context: context, Mood: "Eat Healthy"),
              MoodCategory(context: context, Mood: "Tired")
            ],
          )
        ],
      ),
    ),
  );
}

Widget MoodCategory({required BuildContext context, required String Mood}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        AppImages().tiredMood,
        width: 25,
      ),
      Text(
        Mood,
        style: TextStyle(
            color: Colors.white,
            fontSize: 5 * MediaQuery.of(context).devicePixelRatio,
            fontWeight: FontWeight.w500),
      ),
    ],
  );
}
