// import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
//
// class BranchAnalyticsManager {
//   static Future<Uri> generateDeepLink({
//     required String canonicalIdentifier,
//     required String title,
//     required String contentDescription,
//     required String contentImageUrl,
//     required List<String> keywords,
//     required String channel,
//     required String feature,
//     required String campaign,
//   }) async {
//     final BranchUniversalObject buo = BranchUniversalObject(
//       canonicalIdentifier: canonicalIdentifier,
//       title: title,
//       contentDescription: contentDescription,
//       contentImageUrl: contentImageUrl,
//       keywords: keywords,
//     );
//
//     final BranchLinkProperties lp = BranchLinkProperties(
//       channel: channel,
//       feature: feature,
//       campaign: campaign,
//     );
//
//     final Uri deepLink = await buo.createDeepLink(lp: lp);
//     return deepLink;
//   }
//
//   static void trackEvent(String eventName) {
//
//   }
// }
