import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget cstCustomInput(
    {String hintText = 'Enter text...',
    TextEditingController? controller,
    required String defaultText}) {
  // TextEditingController is used to control the text field if necessary
  controller ??= TextEditingController(
      text:
          defaultText); // If controller is not provided, initialize it with "Hello"
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(
              10), // This sets the border radius to make the container rounded
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller:
                    controller, // Assigning the provided controller to the TextField
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  border:
                      InputBorder.none, // Removing the border of the TextField
                  hintText: hintText, // Setting the hint text for the TextField
                  hintStyle: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Icon(
              Icons.edit, // Using an edit icon
              color: Color.fromARGB(
                  255, 230, 172, 0), // Setting the color of the icon
            ),
          ],
        ),
      ),
      SizedBox(
        height: 1.5.h,
      )
    ],
  );
}
