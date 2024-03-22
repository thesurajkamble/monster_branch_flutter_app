import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:uuid/uuid.dart';

class BranchAnalyticsManager {
  BranchContentMetaData metadata = BranchContentMetaData();
  BranchLinkProperties lp = BranchLinkProperties();
  late BranchUniversalObject buo;
  late BranchEvent eventStandard;
  late BranchEvent eventCustom;

  DateTime today = DateTime.now();

  Future<String> generateDeepLink(String monsterImage, String monsterName) async {
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
}
