import 'package:get/get.dart';

import '../controllers/flashlight_feature_controller.dart';

class FlashlightFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlashlightFeatureController>(
      () => FlashlightFeatureController(),
    );
  }
}
