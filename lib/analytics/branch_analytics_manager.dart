import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:uuid/uuid.dart';

class BranchAnalyticsManager {
  BranchContentMetaData metadata = BranchContentMetaData();
  BranchLinkProperties lp = BranchLinkProperties();
  late BranchUniversalObject buo = BranchUniversalObject(
    canonicalIdentifier: 'flutter/branch',
    contentMetadata: BranchContentMetaData(),
  );
  late BranchEvent eventStandard;
  late BranchEvent eventCustom;

  DateTime today = DateTime.now();

  Future<String> generateDeepLink(
      String monsterImage, String monsterName) async {
    String dateString =
        '${today.year}-${today.month}-${today.day} ${today.hour}:${today.minute}:${today.second}';
    metadata = BranchContentMetaData()
      ..addCustomMetadata('monsterImage', monsterImage)
      ..addCustomMetadata('monsterName', monsterName)
      ..addCustomMetadata('date_created', dateString);
    BranchUniversalObject branchUniversalObject = BranchUniversalObject(
      canonicalIdentifier: 'flutter/branch',
      contentMetadata: metadata,
    );

    FlutterBranchSdk.registerView(buo: branchUniversalObject);

    BranchLinkProperties lp = BranchLinkProperties(feature: 'sharing');
    lp.addControlParam('\$uri_redirect_mode', '1');

    BranchResponse response = await FlutterBranchSdk.getShortUrl(
        buo: branchUniversalObject, linkProperties: lp);

    if (response.success) {
      return response.result!;
    } else {
      throw Exception(
          'Error : ${response.errorCode} - ${response.errorMessage}');
    }
  }

  void sendCommerceEvent(
      {required String eventName,
      required String transactionID,
      required BranchCurrencyType currency,
      required double revenue,
      required double shipping,
      required double tax,
      required String coupon,
      required String affiliation,
      required String eventDescription,
      required String searchQuery,
      required BranchStandardEvent branchStandardEvent,
      required BranchEventAdType adType}) {
    BranchEvent eventStandard = BranchEvent.standardEvent(branchStandardEvent);
    eventStandard.transactionID = '12344555';
    eventStandard.currency = BranchCurrencyType.BRL;
    eventStandard.revenue = 1.5;
    eventStandard.shipping = 10.2;
    eventStandard.tax = 12.3;
    eventStandard.coupon = 'test_coupon';
    eventStandard.affiliation = 'test_affiliation';
    eventStandard.eventDescription = 'Event_description';
    eventStandard.searchQuery = 'item 123';
    eventStandard.adType = BranchEventAdType.BANNER;
    eventStandard.addCustomData('EVENT_PROPERTY_DEVICE', 'android');
    eventStandard.addCustomData('EVENT_PROPERTY_EPOCH',
        '${today.year}-${today.month}-${today.day} ${today.hour}:${today.minute}:${today.second}');
    FlutterBranchSdk.trackContent(buo: [buo], branchEvent: eventStandard);
  }

  void sendCustomEvent(String eventName) {
    BranchEvent eventCustom = BranchEvent.customEvent(eventName);
    FlutterBranchSdk.trackContent(buo: [buo], branchEvent: eventCustom);
  }
}
