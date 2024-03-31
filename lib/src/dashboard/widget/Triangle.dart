// import 'package:flutter/material.dart';

// class TrianglePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.fill;

//     double triangleWidth =
//         size.width * 0.97; // Adjust the width here (0.8 means 80% of the width)

//     Path path = Path()
//       ..moveTo((size.width - triangleWidth) / 2, size.height)
//       ..lineTo(size.width / 2, 0)
//       ..lineTo(size.width - (size.width - triangleWidth) / 2, size.height)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }

// class TriangleWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: Size(MediaQuery.of(context).size.width, 70),
//       painter: TrianglePainter(),
//     );
//   }
// }

import 'package:flutter/material.dart';

class RectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RectangleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width, 70),
      painter: RectanglePainter(),
    );
  }
}
