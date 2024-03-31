import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/app_colors.dart';

Widget Authenticate_biometric(
    {required String iconData, required void Function() authenticate}) {
  return Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      border: Border.all(color: AppColors().white),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: TextButton(
      onPressed: () => {
        authenticate(),
      },
      child: SvgPicture.asset(
        iconData,
        width: 30,
        height: 30,
        // color: AppColors().white,
        // color: Colors.white,
      ),
    ),
  );
}
