import 'package:flavors/util/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store_checker/store_checker.dart';

import 'flavor_model.dart';

enum BuildType {
  RELEASE,
  STAGING,
  DEBUG,
}

class Config {
  static FlavorModel appFlavor = FlavorModel(flavor: Flavor.CLIENT, isRelease: kReleaseMode);

  static Future<String> getBackendURL() async {
    final flavorTypeUrl = appFlavor.flavor == Flavor.BUSINESS ? 'business' : 'client';
    final buildType = await getBuildType();
    switch (buildType) {
      case BuildType.RELEASE:
        return 'https://$flavorTypeUrl.release-api.com/api';
      case BuildType.STAGING:
        return 'https://$flavorTypeUrl.staging-api.com/api';
      case BuildType.DEBUG:
        return 'https://$flavorTypeUrl.development-api.com/api';
    }
  }

  static Future<BuildType> getBuildType() async {
    final installationSource = await StoreChecker.getSource;
    final isInstalledFromStore =
        installationSource == Source.IS_INSTALLED_FROM_APP_STORE ||
            installationSource == Source.IS_INSTALLED_FROM_PLAY_STORE;
    if (appFlavor.isRelease && !isInstalledFromStore) {
      // Release: build installed via AppTester and etc.
      return BuildType.STAGING;
    } else if (appFlavor.isRelease) {
      // Production: build installed via PlayStore or AppStore
      return BuildType.RELEASE;
    }  else {
      // Debug
      return BuildType.DEBUG;
    }
  }

  static Future<Pair<String, AlignmentGeometry>?> getBannerBuildType() async {
    final buildType = await getBuildType();
    return Pair(buildType.name, Alignment.bottomLeft);
  }

  static Future<Pair<String, AlignmentGeometry>?> getBannerFlavorType() async {
    return Pair(appFlavor.flavor.name, Alignment.bottomRight);
  }
}
