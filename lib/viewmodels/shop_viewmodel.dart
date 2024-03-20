import 'dart:async';
import 'dart:collection';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
// import 'package:branch_sdk/Branch.dart';
import 'package:fluttertoast/fluttertoast.dart';

const CHANNEL_ID = "MyNotificationChannel";
var isFromDeepLink = false;


class ShopViewModel {
  late HashMap<String, List<String>> monsterData;

  ShopViewModel() {
    monsterData = HashMap.from({
      "monster1": ["Astrocreep", "A_blue.png", "#d8e8f6", "#18689c", "travel"],
      "monster2": ["Starbeast", "B_pink.png", "#f0dee6", "#9d172a", "retail"],
      "monster3": [
        "Cosmic Critter",
        "C_green.png",
        "#daeae5",
        "#1a6a37",
        "fintech"
      ],
      "monster4": [
        "Galaxy Gobbler",
        "D_orange.png",
        "#f2e7de",
        "#90571a",
        "lifestyle"
      ],
      "monster5": ["Cuddlekins", "E_teal.png", "#d1eff6", "#00b4c5", "finance"],
      "monster6": ["Pipsqueak", "F_purple.png", "#dfd4e8", "#80378d", "qsr"],
      "monster7": [
        "Snugglebug",
        "G_yellow.png",
        "#f5f1df",
        "#a08614",
        "entertainment"
      ],
      "monster8": [
        "Little Critter",
        "H_red.png",
        "#e3d3d8",
        "#912629",
        "ecommerce"
      ],
    });
  }

  // Future<String?> createBranchDeepLink(BuildContext context) async {
  //   BranchUniversalObject buo = BranchUniversalObject(
  //       title: "My Notification",
  //       contentDescription: "This is a notification from my app");
  //   LinkProperties lp = LinkProperties()
  //     ..channel = "notification"
  //     ..feature = "notification";

  //   try {
  //     Uri url = await buo.generateShortUrl(lp);
  //     print("Deep link URL: $url");
  //     return url.toString();
  //   } catch (e) {
  //     print("Error generating deep link: $e");
  //     return null;
  //   }
  // }

  // String generateBranchLink(String? id, BuildContext context) {
  //   BranchUniversalObject buo = BranchUniversalObject(
  //       title: "Monster App",
  //       contentDescription: "Link created using the Branch SDK");
  //   LinkProperties lp = LinkProperties()
  //     ..channel = "WhatsApp"
  //     ..feature = "sharing"
  //     ..campaign = "Monster sharing"
  //     ..stage = "new user acquire"
  //     ..addControlParam("monsterId", id)
  //     ..addControlParam(
  //         "\$mobileUrl", "https://monster-site.github.io/index.html")
  //     ..addControlParam(
  //         "custom_random", DateTime.now().millisecondsSinceEpoch.toString());
  //   return buo.getShortUrl(lp).toString();
  // }
}
