import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import '../utils/zbotToast.dart';
import 'my_headers.dart';

class ApiRequest {
  Future post(
      {String? url,
      dynamic body,
      Function(String)? onSuccess,
      Function(String)? onError}) async {
    try {
      bool isConnected;
      // if(kIsWeb){
      //  isConnected=  window.navigator.onLine ?? false;
      // }else{
      //   isConnected = await checkInternet();
      // }

      // if (!isConnected) {
      //   ZBotToast.showToastError(message: 'No Internet Connection');
      //   // ShowMessage.inDialog('No Internet Connection', true);
      //   return false;
      // }
      debugPrint(body);
      log("this is url: $url");
      log("this is header: ${MyHeaders.header()}");

      var response = await http
          .post(Uri.parse(url!), headers: MyHeaders.header(), body: body)
          .timeout(const Duration(seconds: 90), onTimeout: () {
        throw Exception("Request Time Out");
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        log("i ma here");
        onSuccess!(response.body);
      } else if (response.statusCode == 401) {
        onError!("Error");
        //  onError!(response.body);
      } else if (response.statusCode == 403) {
        onError!((response.body));
      } else if (response.statusCode == 404) {
        onError!((response.body));
      } else if (response.statusCode == 406) {
        onError!((response.body));
      } else {
        onError!((response.body));
      }
    } catch (e) {
      log(e.toString());
      // ZBotToast.loadingClose();

      log((e.toString()));
    }
  }

  Future<bool> checkInternet() async {
    // return Future.value(true);
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        log('connected');
        return true;
      }
    } on SocketException catch (_) {
      log('not connected');
      return false;
    }
    return false;
  }

  // Put Function
  Future put(
      {String? url,
      var body,
      var header,
      Function(String)? onSuccess,
      Function(String)? onError}) async {
    try {
      bool isConnected;
      // if(kIsWeb){
      //  isConnected=  window.navigator.onLine ?? false;
      // }else{
      //   isConnected = await checkInternet();
      // }
      // if (!isConnected) {
      //   ZBotToast.showToastError(message: "No Internet Connection");
      //   // AppMessage.snackbar("Fail", "No Internet Connection", AppColors.red);
      //   // ShowMessage.inDialog('No Internet Connection', true);
      //   return false;
      // }
      log("this is put url: $url");
      log("put request body: $body");
      // print("this is header: ${MyHeaders.header()}");
      var response = await http
          .put(Uri.parse(url!), headers: MyHeaders.header(), body: body)
          .timeout(const Duration(seconds: 90), onTimeout: () {
        throw Exception("Request Time Out");
      });
      log(response.body);

      // log(header);
      // log(response.statusCode.toString());
      log("check");
      if (response.statusCode >= 200 && response.statusCode < 300) {
        log("i ma here");
        //   print(response.body.toString());
        onSuccess!(response.body);
      } else if (response.statusCode == 404) {
        onError!(response.body);
      } else if (response.statusCode == 401) {
        onError!(response.body);
      } else if (response.statusCode == 403) {
        onError!(response.body);
      } else {
        log("i am in error  ${response.body}");
        log("object");
        //   onError!(jsonDecode(response.body));
        log(response.body.toString());
        onError!(response.body);
      }
    } catch (e) {
      log("i am in error catch ${e.toString()}");
      onError!(e.toString());
    }
  }

  // Get function
  Future get(
      {String? url,
      Function(String)? onSuccess,
      Function(String)? onError,
      var header}) async {
    // bool isConnected = await checkInternet();
    // if (!isConnected) {
    //   return false;
    // }
    try {
      bool isConnected;
      // if(kIsWeb){
      //  isConnected=  window.navigator.onLine ?? false;
      // }else{
      //   isConnected = await checkInternet();
      // }
      // if (!isConnected) {
      //   ZBotToast.showToastError(message: "No Internet Connection");
      //   return false;
      // }
      log("this is get Url: $url");
      log("this is header: ${jsonEncode(MyHeaders.header())}");
      var response = await http
          .get(Uri.parse(url!), headers: header)
          .timeout(const Duration(seconds: 60), onTimeout: () {
        throw Exception("Request Time Out");
      });

      debugPrint("ss");

      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        onSuccess!(utf8.decode(response.bodyBytes));
      } else {
        log("i am in error  ${response.body}");
        onError!(response.body);
      }
    } catch (e) {
      log("i am in error catch ${e.toString()}");
      onError!(e.toString());
    }
  }

  // delete function
  Future delete(
      {String? url,
      Function(String)? onSuccess,
      Function(String)? onError,
      var header}) async {
    try {
      bool isConnected;
      // if(kIsWeb){
      //  isConnected=  window.navigator.onLine ?? false;
      // }else{
      //   isConnected = await checkInternet();
      // }
      // if (!isConnected) {
      //   ZBotToast.showToastError(message: "No Internet Connection");

      //   return false;
      // }
      log("this is get Url: $url");
      log("this is header: ${jsonEncode(MyHeaders.header())}");
      var response = await http
          .delete(Uri.parse(url!), headers: header)
          .timeout(const Duration(seconds: 60), onTimeout: () {
        throw Exception("Request Time Out");
      });
      log(response.body);

      if (response.statusCode == 200) {
        onSuccess!(response.body);
      } else if (response.statusCode == 204) {
        onError!(response.body);
      } else if (response.statusCode == 404) {
        onError!(response.body);
      } else {
        log("i am in error  ${response.body}");
        onError!(response.body);
      }
    } catch (e) {
      log("i am in error catch ${e.toString()}");
      onError!(e.toString());
    }
  }
}
