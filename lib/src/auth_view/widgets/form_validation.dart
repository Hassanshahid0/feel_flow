import 'dart:convert';
import 'dart:io';
//import 'package:feel_flow/src/dashboard/home_page.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/apis.dart';
import '../../../utils/zbotToast.dart';
import '../../dashboard/Home/Home.dart';

void login_validation(emailText, passText, bool remember_me) {
  if (emailText == "") {
    ZBotToast.showToastError(message: "Please enter email");
    ZBotToast.loadingClose();
  } else if (validateEmail(emailText)) {
    ZBotToast.showToastError(message: "Please enter a valid email");
    ZBotToast.loadingClose();
  } else if (passText == "") {
    ZBotToast.showToastError(message: "Please enter password");
    ZBotToast.loadingClose();
  } else {
    login_credentials(emailText, passText, remember_me);
    ZBotToast.showToastSuccess(message: "Successfully Logged In");
    ZBotToast.loadingClose();
  }
}

bool validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value) ? true : false;
}

void login_credentials(String email, String password, bool remember_me) async {
  try {
    var request =
        await HttpClient().postUrl(Uri.parse('${APIS.baseUrl}${APIS.login}'));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode('{"email": "$email", "password": "$password"}'));
    var response = await request.close();
    if (response.statusCode == 200) {
      if (remember_me == true) {
        print("This User will be Remembered");
        saveLoginDetails(email, password);
      }
      //  ZBotToast.showToastSuccess(message: "Successfully Logged In");
      //ZBotToast.loadingClose();
      // Get.to(() => LandingPage());
      Get.to(() => HomePageWidget());
    } else {
      ZBotToast.showToastError(message: "Incorrect Username or Password");
      ZBotToast.loadingClose();
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<void> saveLoginDetails(String email, String password) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', email);
  await prefs.setString('password', password);
}

Future<Map<String, String>> getLoginDetails() async {
  final prefs = await SharedPreferences.getInstance();
  final email = prefs.getString('email');
  final password = prefs.getString('password');
  return {'email': email ?? '', 'password': password ?? ''};
}

// Future<bool> check_saved_data_availability() async {
//   var loginDetails = await getLoginDetails();
//   String? email = loginDetails['email'];
//   String? password = loginDetails['password'];
//
//   var request =
//       await HttpClient().postUrl(Uri.parse('${APIS.baseUrl}${APIS.login}'));
//   request.headers.set('content-type', 'application/json');
//   request.add(utf8.encode('{"email": "$email", "password": "$password"}'));
//   var response = await request.close();
//   if (response.statusCode == 200) {
//     print("HELLO");
//     return true;
//   }
//   return false;
// }

Future<bool> check_saved_data_availability() async {
  var loginDetails = await getLoginDetails();
  String? email = loginDetails['email'];
  String? password = loginDetails['password'];

  var request =
      await HttpClient().postUrl(Uri.parse('${APIS.baseUrl}${APIS.login}'));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode('{"email": "$email", "password": "$password"}'));
  var response = await request.close();
  if (response.statusCode == 200) {
    return true;
  }
  return false;
}
