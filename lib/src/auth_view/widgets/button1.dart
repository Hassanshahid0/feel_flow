import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double height;
  final double width;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final String? imagePath; // Nullable image path
  final String buttonText;
  final Color fillColor;
  final double fontSize;
  final VoidCallback onPressed;

  const MyButton({
    Key? key,
    required this.height,
    required this.width,
    required this.textColor,
    required this.borderColor,
    required this.borderRadius,
    this.imagePath, // Nullable image path
    required this.buttonText,
    required this.fillColor,
    required this.fontSize,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(borderRadius),
        color: fillColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (imagePath != null) ...[
              Transform.scale(
                scale: 0.6, // Adjust the scale value as needed
                child: Image.asset(
                  imagePath!,
                ),
              ),
              const SizedBox(width: 9.0),
            ],
            Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize, // Use the font size parameter
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Example usage:
// MyButton(
//   height: 50,
//   width: double.infinity,
//   borderColor: Colors.white,
//   borderRadius: 8.0,
//   imagePath: null, // Set to null for no image
//   buttonText: 'Button without Image',
//   textColor: Colors.white,
//   fillColor: Colors.blue,
//   onPressed: () async {
//     print("Button without Image pressed");
//   },
//   fontSize: 16, // Pass the font size value
// ),
