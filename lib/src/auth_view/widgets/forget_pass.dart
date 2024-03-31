import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../resources/app_colors.dart';
//import '../../dashboard/widgets/textButton.dart';

void Forget_pass_Dialog(BuildContext context) => showDialog(
  context: context,
  builder: (BuildContext context) {
    TextEditingController emailcontroller=TextEditingController();
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors().white  ,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: AppColors().black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 10,
                      child: Icon(
                        Icons.close,
                        color: AppColors().white,
                        size: 12,
                      ),
                    ),
                    onTap: () => {
                      Navigator.of(context).pop(),
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Please enter email address\nassociated with your account',
                style: TextStyle(color: AppColors().black, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailcontroller,
                cursorColor: AppColors().black,
                style: TextStyle(color: AppColors().white),
                decoration:  InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: AppColors().black),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors().textColor)
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors().pink)
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
             // CustomTextButton(text: "Send", color:AppColors().pink, onSubmit: (){Get.back();},)
            ],
          ),
        ),
      ),
    );
  },
);

void Unlock_varification_Dialog({required String iconData , required String displayText, required BuildContext context}) => showDialog(
  context: context,
  barrierColor: Colors.black.withOpacity(0.1),
  builder: (BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
        ),
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors().white  ,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(""),
                      GestureDetector(
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 10,
                          child: Icon(
                            Icons.close,
                            color: AppColors().white,
                            size: 12,
                          ),
                        ),
                        onTap: () => {
                          Navigator.of(context).pop(),
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(
                    "${iconData}",
                    width: 50,
                    height: 50,
                    color: AppColors().textOrange,
                    // color: Colors.white,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    displayText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors().black, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  },
);