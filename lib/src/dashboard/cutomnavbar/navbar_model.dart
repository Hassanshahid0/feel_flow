// import 'package:feel_flow/src/dashboard/Home/Home.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/get_navigation.dart';

// import '../../../flutter_flow/flutter_flow_model.dart';
// import '../graph_view.dart';
// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'customnavbarmodel.dart';
// export 'customnavbarmodel.dart';

// class CustomNavbarWidget extends StatefulWidget {
//   @override
//   State<CustomNavbarWidget> createState() => _CustomNavbarWidgetState();
// }

// class _CustomNavbarWidgetState extends State<CustomNavbarWidget> {
//   late CustomNavbarModel _model;

//   @override
//   void setState(VoidCallback callback) {
//     super.setState(callback);
//     _model.onUpdate();
//   }

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => CustomNavbarModel());
//   }

//   @override
//   void dispose() {
//     _model.maybeDispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<SvgPicture> svgIcons = [
//       SvgPicture.asset('assets/icons/entries.svg'),
//       SvgPicture.asset('assets/icons/stats.svg'),
//       SvgPicture.asset('assets/icons/calander.svg'),
//       SvgPicture.asset('assets/icons/more.svg'),
//     ];

//     return Container(
//       width: double.infinity,
//       height: 80,
//       decoration: const BoxDecoration(
//         color: Colors.transparent,
//       ),
//       child: Stack(
//         alignment: const AlignmentDirectional(0, 1),
//         children: [
//           Container(
//             width: double.infinity,
//             height: 80,
//             decoration: const BoxDecoration(),
//             child: Stack(
//               alignment: const AlignmentDirectional(0, 0),
//               children: [
//                 Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 15),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: SvgPicture.asset(
//                       'assets/images/nav-bg-dark.svg',
//                       fit: BoxFit.fitWidth,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 10),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       FlutterFlowIconButton(
//                         borderRadius: 20,
//                         buttonSize: 40,
//                         icon: Icon(
//                           Icons.home,
//                           color: Colors.white,
//                           size: 24,
//                         ),
//                         onPressed: () async {
//                           Get.to(
//                             () => HomePageWidget(),
//                             duration: const Duration(milliseconds: 50),
//                             transition: Transition.cupertino,
//                           );
//                           // context.goNamed(
//                           //   'HomePage',
//                           //   extra: <String, dynamic>{
//                           //     kTransitionInfoKey: TransitionInfo(
//                           //       hasTransition: true,
//                           //       transitionType: PageTransitionType.fade,
//                           //       duration: Duration(milliseconds: 0),
//                           //     ),
//                           //   },
//                           // );
//                         },
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsetsDirectional.fromSTEB(0, 0, 48, 0),
//                         child: FlutterFlowIconButton(
//                           borderRadius: 20,
//                           buttonSize: 40,
//                           icon: const Icon(
//                             Icons.notification_add,
//                             color: Colors.white,
//                             size: 24,
//                           ),
//                           onPressed: () async {
//                             Get.to(
//                               () => const GraphView(),
//                               duration: const Duration(milliseconds: 50),
//                               transition: Transition.cupertino,
//                             );
//                             // context.goNamed(
//                             //   'Wishlist',
//                             //   extra: <String, dynamic>{
//                             //     kTransitionInfoKey: TransitionInfo(
//                             //       hasTransition: true,
//                             //       transitionType: PageTransitionType.fade,
//                             //       duration: Duration(milliseconds: 0),
//                             //     ),
//                             //   },
//                             // );
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             const EdgeInsetsDirectional.fromSTEB(48, 0, 0, 0),
//                         child: FlutterFlowIconButton(
//                           borderRadius: 20,
//                           buttonSize: 40,
//                           icon: Icon(
//                             Icons.favorite,
//                             color: Colors.white,
//                             size: 24,
//                           ),
//                           onPressed: () async {
//                             // context.goNamed(
//                             //   'Cart',
//                             //   extra: <String, dynamic>{
//                             //     kTransitionInfoKey: TransitionInfo(
//                             //       hasTransition: true,
//                             //       transitionType: PageTransitionType.fade,
//                             //       duration: Duration(milliseconds: 0),
//                             //     ),
//                             //   },
//                             // );
//                           },
//                         ),
//                       ),
//                       FlutterFlowIconButton(
//                         borderRadius: 20,
//                         buttonSize: 40,
//                         icon: Icon(
//                           Icons.person,
//                           color: Colors.white,
//                           size: 24,
//                         ),
//                         onPressed: () async {
//                           // context.goNamed(
//                           //   'Profile',
//                           //   extra: <String, dynamic>{
//                           //     kTransitionInfoKey: TransitionInfo(
//                           //       hasTransition: true,
//                           //       transitionType: PageTransitionType.fade,
//                           //       duration: Duration(milliseconds: 0),
//                           //     ),
//                           //   },
//                           // );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Align(
//             alignment: const AlignmentDirectional(0, -0.2),
//             // child: FlutterFlowIconButton(
//             //   borderRadius: 30,
//             //   borderWidth: 1,
//             //   buttonSize: 60,
//             //   fillColor: const Color(0xFFF08D23),
//             //   icon: Icon(
//             //     Icons.add,
//             //     color: Colors.white,
//             //     size: 35,
//             //   ),
//             //   onPressed: () async {},
//             // ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:feel_flow/src/dashboard/calander_view.dart';
import 'package:feel_flow/src/dashboard/widget/cst_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart'; // Import Get package for navigation

import '../../../flutter_flow/flutter_flow_model.dart';
import '../Home/Home.dart';
import '../graph_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'customnavbarmodel.dart';
export 'customnavbarmodel.dart';

class CustomNavbarWidget extends StatefulWidget {
  @override
  State<CustomNavbarWidget> createState() => _CustomNavbarWidgetState();
}

class _CustomNavbarWidgetState extends State<CustomNavbarWidget> {
  late CustomNavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomNavbarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> svgIcons = [
      SvgPicture.asset('assets/icons/entries.svg'),
      SvgPicture.asset('assets/icons/stats.svg'),
      SvgPicture.asset('assets/icons/calander.svg'),
      SvgPicture.asset('assets/icons/more.svg'),
    ];

    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Stack(
        alignment: const AlignmentDirectional(0, 1),
        children: [
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(),
            child: Stack(
              alignment: const AlignmentDirectional(0, 0),
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(15, 5, 15, 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SvgPicture.asset(
                      'assets/images/nav-bg-dark.svg',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 30, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: svgIcons[0],
                        onPressed: () {
                          Get.offAll(
                            () => HomePageWidget(),
                            duration: const Duration(milliseconds: 50),
                            transition: Transition.cupertino,
                          );
                        },
                      ),
                      IconButton(
                        icon: svgIcons[1],
                        onPressed: () {
                          // Navigate to Stats page
                          Get.offAll(
                            () => const GraphView(),
                            duration: const Duration(milliseconds: 50),
                            transition: Transition.cupertino,
                          );
                        },
                      ),
                      IconButton(
                        icon: svgIcons[2],
                        onPressed: () {
                          Get.offAll(
                            () => CalanderView(),
                            duration: const Duration(milliseconds: 50),
                            transition: Transition.cupertino,
                          );
                        },
                      ),
                      IconButton(
                        icon: svgIcons[3],
                        onPressed: () {
                          // Add functionality for the fourth icon
                          Get.to(
                            () => cstDrawer(),
                            duration: const Duration(milliseconds: 50),
                            transition: Transition.cupertino,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0, -0.2),
            // child: IconButton(
            //   icon: Icon(
            //     Icons.add,
            //     color: Colors.white,
            //     size: 35,
            //   ),
            //   onPressed: () {
            //     // Add functionality for the floating button
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}
