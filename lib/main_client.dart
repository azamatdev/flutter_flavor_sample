import 'package:flavors/main_common.dart';
import 'package:flutter/foundation.dart';
import 'app/app_config.dart';
import 'app/flavor_model.dart';

void main() {
  Config.appFlavor = FlavorModel(flavor: Flavor.CLIENT, isRelease: kReleaseMode);
  runMain();
}
