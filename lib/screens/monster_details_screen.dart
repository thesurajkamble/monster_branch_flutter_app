import 'dart:convert';

import 'package:MonsterApp/analytics/branch_analytics_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:MonsterApp/viewmodels/common_viewmodel.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../Local_notification_Service.dart';

final LocalNotificationService notificationService = LocalNotificationService();
final BranchAnalyticsManager analyticsManager = BranchAnalyticsManager();

class MonsterDetailScreen extends StatelessWidget {
  final String monsterName;
  final String monsterImage;

  const MonsterDetailScreen(
      {super.key, required this.monsterName, required this.monsterImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(monsterName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/$monsterImage',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    CommonViewmodel.showToast(
                        "Monster $monsterName bought successfully");
                  },
                  child: const Text('Buy Now'),
                ),
                ElevatedButton(
                  onPressed: () {
                    CommonViewmodel.showToast("$monsterName is Added to Cart!");
                  },
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    // String notifDeepLink = await analyticsManager
                    //     .generateDeepLink(monsterImage, monsterName);
                    // print(analyticsManager.generateDeepLink(
                    //     monsterName, monsterName));
                    Map<String, dynamic> payloadData = {
                      'monsterName': monsterName,
                      'monsterImage': monsterImage,
                    };
                    String payload = jsonEncode(payloadData);

                    notificationService.showNotificationAndroid(
                        "Your cute lil monster $monsterName",
                        "$monsterName is shared from monster shop list",
                        payload);
                    notificationService.showNotificationIos(
                        "Your cute lil monster $monsterName",
                        "$monsterName is shared from monster shop list",
                        payload);
                  },
                  icon: const Icon(Icons.notifications),
                ),
                IconButton(
                  onPressed: () async {
                    String deepLink = await analyticsManager.generateDeepLink(
                        monsterImage, monsterName);
                    final result = await Share.shareWithResult(
                        "check out my website $deepLink");
                    if (result.status == ShareResultStatus.success) {
                      CommonViewmodel.showToast(
                          "Monster $monsterName shared successfully");
                    } else {
                      CommonViewmodel.showToast(
                          "Not able to share $monsterName");
                    }
                  },
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
