import 'dart:io';
import 'dart:ui';
import 'package:feel_flow/resources/app_images.dart';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';
import '../../resources/app_colors.dart';

class Temp_Images extends StatefulWidget {
  final List<XFile> images;
  Temp_Images({Key? key, required this.images}) : super(key: key);

  @override
  State<Temp_Images> createState() => _Temp_ImagesState();
}

class _Temp_ImagesState extends State<Temp_Images> {
  bool image_is_selected = false;
  List<String> final_images = [];
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      // height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors().black,
                      ),
                      child: Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        widget.images.length.toString() + " Photos",
                        style:
                            TextStyle(color: AppColors().white, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors().black,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              // padding: EdgeInsets.all(10),
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              crossAxisCount: 4,
                              shrinkWrap: true,
                              children:
                                  List.generate(widget.images.length, (index) {
                                return Temp_images_cart(
                                    AppImage: widget.images[index].path);
                                // return Uploaded_Image(AppImage: AppImages().office5,);
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // CustomTextButton(
                    //     text: "Submit",
                    //     color: AppColors().pink,
                    //     onSubmit: () {
                    //       Get.to(ListImages());
                    //       print('Widget pressed!');
                    //     })
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Uploaded_Image extends StatefulWidget {
  final String AppImage;
  Uploaded_Image({required this.AppImage});

  @override
  _Uploaded_ImageState createState() => _Uploaded_ImageState();
}

class _Uploaded_ImageState extends State<Uploaded_Image> {
  bool _selected = false;

  List<String> final_images = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          final_images.add(widget.AppImage);
          _selected = !_selected;
          print(final_images);
        });
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              widget.AppImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Visibility(
            visible: _selected,
            child: Positioned(
              right: 2,
              bottom: 2,
              child: SvgPicture.asset(
                "assets/icons/rectangle.svg",
                height: 15,
                width: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Temp_images_cart extends StatefulWidget {
  final String AppImage;
  const Temp_images_cart({Key? key, required this.AppImage}) : super(key: key);

  @override
  State<Temp_images_cart> createState() => _Temp_images_cartState();
}

class _Temp_images_cartState extends State<Temp_images_cart> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selected = !_selected;
        });
      },
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.file(
                File(widget.AppImage),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )),
          Visibility(
            visible: _selected,
            child: Positioned(
              right: 2,
              bottom: 2,
              child: SvgPicture.asset(
                "assets/icons/rectangle.svg",
                height: 15,
                width: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
