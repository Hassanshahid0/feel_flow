// import 'package:feel_flow/src/dashboard/camera_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../atm_list.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:intl/intl.dart';
// import '../home_page.dart';

class FeelFlow_App_Bar extends StatelessWidget implements PreferredSizeWidget {
  final bool isScrolled;

  FeelFlow_App_Bar({
    required this.isScrolled,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Center(
        child: Text(
          "${DateFormat.MMMM().format(DateTime.now())} ${DateTime.now().year}",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor:
          isScrolled ? Color.fromARGB(255, 18, 18, 18) : Colors.transparent,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search_sharp,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            // Handle search button press
          },
        ),
      ],
    );
  }
}
