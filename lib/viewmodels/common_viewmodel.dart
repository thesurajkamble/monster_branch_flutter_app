import 'package:flutter/material.dart';

import '../Local_notification_Service.dart';
import 'package:fluttertoast/fluttertoast.dart';

 class CommonViewmodel{
  static void showCustomNotification(
      String title,
      String body,
      String imageUrl,
      String deepLinkUrl
      ) {
    LocalNotificationService.showNotification(
      title: title,
      body: body,
      imageUrl: imageUrl,
      url: deepLinkUrl,
    );
  }

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
}