import 'package:get/get.dart';

import '../controllers/wifi_conncetion_feature_controller.dart';

class WifiConncetionFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WifiConncetionFeatureController>(
      () => WifiConncetionFeatureController(),
    );
  }
}
