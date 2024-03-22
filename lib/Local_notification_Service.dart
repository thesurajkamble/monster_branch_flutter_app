import 'dart:async';
import 'dart:convert';

import 'package:MonsterApp/main.dart';
import 'package:MonsterApp/screens/monster_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class LocalNotificationService {
  StreamSubscription<Map>? streamSubscriptionDeepLink;
  late BuildContext context;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();


  Future<void> init(BuildContext context) async {
    this.context = context;
    // init for android
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('a_blue');
    // init for ios
    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  void showNotificationAndroid(String title, String value,
      String notifDeepLink) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'channel_id',
      'Channel Name',
      channelDescription: 'branch android link',
      icon: "@drawable/a_blue",
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    int notificationId = 1;
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
    // String payloadDeeplink = linkUri;
    await flutterLocalNotificationsPlugin.show(
        notificationId, title, value, notificationDetails,
        payload: notifDeepLink);
  }

  void showNotificationIos(String title, String value, String linkUri) async {
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
    DarwinNotificationDetails();
    int notificationId = 1;
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(iOS: iOSPlatformChannelSpecifics);
    String payloadDeeplink = linkUri;
    await flutterLocalNotificationsPlugin.show(
        notificationId, title, value, platformChannelSpecifics,
        payload: payloadDeeplink);
  }

  Future<void> requestIOSPermissions() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> onDidReceiveNotificationResponse(
      NotificationResponse? notificationResponse) async {
    if (notificationResponse != null) {
      String? payload = notificationResponse.payload;
      if (payload != null) {
        Map<String, dynamic> payloadData = jsonDecode(payload);

        String? monsterName = payloadData['monsterName'];
        String? monsterImage = payloadData['monsterImage'];

        if (monsterName != null && monsterImage != null) {
          await Navigator.push(
            context, // Use the context passed during initialization
            MaterialPageRoute(
              builder: (context) =>
                  MonsterDetailScreen(
                    monsterName: monsterName,
                    monsterImage: monsterImage,
                  ),
            ),
          );
        }
      }
    }
  }
}
