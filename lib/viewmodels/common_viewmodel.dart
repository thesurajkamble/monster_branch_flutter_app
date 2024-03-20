import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';

import '../Local_notification_Service.dart';
import 'package:fluttertoast/fluttertoast.dart';

 class CommonViewmodel{


  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.7),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void enableTracking() {
    FlutterBranchSdk.disableTracking(false);
     CommonViewmodel.showToast("tracking enabled");
  }
}