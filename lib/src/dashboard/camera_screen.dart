// ignore_for_file: unused_import

//import 'dart:ffi';
//import 'dart:ui' as ui;

import 'package:feel_flow/resources/app_images.dart';
import 'package:feel_flow/src/dashboard/temporary_images.dart';
import 'package:camera/camera.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import 'widget/cst_drawer.dart';

class CameraScreen extends StatefulWidget {
  late CameraDescription? camera;
  CameraScreen({super.key, this.camera});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;
  List<XFile> images = [];

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_){
    initialize_camera();
    // });
    // initialize_camera();
  }

  initialize_camera() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    late CameraDescription frontCamera;

    // Find the front camera
    for (CameraDescription camera in cameras) {
      if (camera.lensDirection == CameraLensDirection.front) {
        frontCamera = camera;
        break;
      }
    }

    final firstCamera = frontCamera;
    setState(() {
      widget.camera = firstCamera;
      if (firstCamera != null) {
        _controller = CameraController(
          firstCamera,
          ResolutionPreset.medium,
        );
        _initializeControllerFuture = _controller.initialize();
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  void _takePicture() async {
    try {
      await _initializeControllerFuture;
      XFile imageFile = await _controller.takePicture();
      setState(() {
        images.add(imageFile);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: cstDrawer(),
      body: Stack(
        children: [
          Image.asset(
            AppImages().cameraBackground,
            fit: BoxFit.cover,
            alignment: const Alignment(0.12, 0),
            height: Get.height * 1.0,
            width: Get.width * 1.0,
          ),
          // Positioned.fill(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          //     child: Container(
          //       color: Colors.white.withOpacity(0.15),
          //     ),
          //   ),
          // ),
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SafeArea(
                  child: Column(
                    children: [
                      // const FeelFlow_App_Bar(),
                      SizedBox(
                        height: 5.h,
                      ),
                      ClipOval(
                        child: Container(
                          height: Get.width /
                              1.5, // Adjust the size of the oval as needed
                          width: Get.width /
                              1.5, // Adjust the size of the oval as needed
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width: _controller.value.previewSize!.height,
                              height: _controller.value.previewSize!.width,
                              child: CameraPreview(_controller),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: Get.height / 4,
                      ),

                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "You are capable of achieving greatness",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  const BoxShadow(
                                      color: Colors.white, spreadRadius: 1),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(Temp_Images(
                                    images: images,
                                  ));
                                  // setState(() {});
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: images.length == 0
                                      ? Image.asset(
                                          AppImages().gallery,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        )
                                      : Image.file(
                                          File(images[images.length - 1].path),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _takePicture,
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 5,
                                ),
                                boxShadow: [
                                  const BoxShadow(
                                      color: Colors.white, spreadRadius: 2),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _takePicture,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Icon(
                                Icons.flip_camera_ios_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
