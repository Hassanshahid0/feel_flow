import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/app_colors.dart';

class FormFields extends StatefulWidget {
  String text;
  String placeHolder;
  bool isPassword;
  TextEditingController controller;

  FormFields(
      {Key? key,
      required this.text,
      required this.placeHolder,
      this.isPassword = false,
      required this.controller})
      : super(key: key);

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller:widget.controller,
          obscureText: widget.isPassword,
          style: TextStyle(color: AppColors().white),
          // cursorColor: AppColors().textOrange,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            filled: true,
            hintText: widget.placeHolder,
            hintStyle: TextStyle(fontSize: 16.0, color: AppColors().white),
            fillColor: AppColors().transparent,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color:AppColors().pink, // Color of the border when focused
                width: 2, // Width of the border
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color:AppColors().white, // Color of the border when focused
                width: 2, // Width of the border
              ),
            ),
          ),
        ),
      ],
    );
  }
}
