import 'package:get/get.dart';

import '../controllers/touchscreen_feature_controller.dart';

class TouchscreenFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TouchscreenFeatureController>(
      () => TouchscreenFeatureController(),
    );
  }
}
