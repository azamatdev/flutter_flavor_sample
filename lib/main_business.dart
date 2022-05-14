import 'package:flutter/foundation.dart';
import 'app/app_config.dart';
import 'app/flavor_model.dart';
import 'main_common.dart';

void main() {
  Config.appFlavor = FlavorModel(flavor: Flavor.BUSINESS, isRelease: kReleaseMode);
  runMain();
}
