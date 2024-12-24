import 'package:get/get.dart';

import '../controllers/vibration_feature_controller.dart';

class VibrationFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VibrationFeatureController>(
      () => VibrationFeatureController(),
    );
  }
}
