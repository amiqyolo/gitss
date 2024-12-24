import 'package:get/get.dart';

import '../controllers/camera_feature_controller.dart';

class CameraFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CameraFeatureController>(
      () => CameraFeatureController(),
    );
  }
}
