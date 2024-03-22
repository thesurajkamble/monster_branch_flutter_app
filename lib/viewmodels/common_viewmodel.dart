import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';

import '../Local_notification_Service.dart';
import 'package:fluttertoast/fluttertoast.dart';

 class CommonViewmodel{

   static final Map<String, List<String>> monsterData = {
     "monster1": ["Astrocreep", "a_blue.png", "#d8e8f6", "#18689c", "travel"],
     "monster2": ["Starbeast", "b_pink.png", "#f0dee6", "#9d172a", "retail"],
     "monster3": [
       "Cosmic Critter",
       "c_green.png",
       "#daeae5",
       "#1a6a37",
       "fintech"
     ],
     "monster4": [
       "Galaxy Gobbler",
       "d_orange.png",
       "#f2e7de",
       "#90571a",
       "lifestyle"
     ],
     "monster5": ["Cuddlekins", "e_teal.png", "#d1eff6", "#00b4c5", "finance"],
     "monster6": ["Pipsqueak", "f_purple.png", "#dfd4e8", "#80378d", "qsr"],
     "monster7": [
       "Snugglebug",
       "g_yellow.png",
       "#f5f1df",
       "#a08614",
       "entertainment"
     ],
     "monster8": [
       "Little Critter",
       "h_red.png",
       "#e3d3d8",
       "#912629",
       "ecommerce"
     ],
     "monster9": ["Starbeast", "b_pink.png", "#f0dee6", "#9d172a", "retail"],
     "monster10": [
       "Cosmic Critter",
       "c_green.png",
       "#daeae5",
       "#1a6a37",
       "fintech"
     ],
     "monster11": [
       "Galaxy Gobbler",
       "d_orange.png",
       "#f2e7de",
       "#90571a",
       "lifestyle"
     ],
     "monster12": ["Cuddlekins", "e_teal.png", "#d1eff6", "#00b4c5", "finance"],
     "monster13": ["Pipsqueak", "f_purple.png", "#dfd4e8", "#80378d", "qsr"],
     "monster14": [
       "Snugglebug",
       "g_yellow.png",
       "#f5f1df",
       "#a08614",
       "entertainment"
     ],
     "monster15": [
       "Little Critter",
       "h_red.png",
       "#e3d3d8",
       "#912629",
       "ecommerce"
     ],
   };

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