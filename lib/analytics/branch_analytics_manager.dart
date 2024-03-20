// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';

// class BranchAnalyticsManager {
//   // static final Branch _branchInstance = Branch();

//   static void trackAddToCartEvent(BuildContext context) async {
//     BranchUniversalObject branchUniversalObject = createBranchUniversalObject();
//     BranchEvent branchEvent = createAddToCartEvent(branchUniversalObject);
//     try {
//       BranchResponse response = await branchEvent.logEvent();
//       // ignore: avoid_print
//       print("Success event sent: ${response.statusCode}");
//     } catch (e) {
//       // ignore: avoid_print
//       print("Failed event: $e");
//     }
//   }

//   static void trackCustomEvents(
//       String eventName, String customProperty, String customProperty2) {
//     BranchEvent(eventName)
//       ..addCustomDataProperty("Custom_Event_Property_Key", customProperty)
//       ..addCustomDataProperty("Custom_Event_Property_Key22", customProperty2)
//       ..setCustomerEventAlias("my_custom_alias")
//       ..logEvent();
//   }

//   static BranchUniversalObject createBranchUniversalObject() {
//     return BranchUniversalObject(
//         canonicalIdentifier: "myprod/1234",
//         canonicalUrl: "https://monster-site.github.io/",
//         title: "share monster");
//   }

//   static BranchEvent createAddToCartEvent(
//       BranchUniversalObject branchUniversalObject) {
//     return BranchEvent(BranchStandardEvent.ADD_TO_CART)
//       ..setAffiliation("test_affiliation")
//       ..setCustomerEventAlias("my_custom_alias")
//       ..setCoupon("Coupon Code")
//       ..setDescription("Customer added item to cart")
//       ..addContentItems([branchUniversalObject]);
//   }
// }
