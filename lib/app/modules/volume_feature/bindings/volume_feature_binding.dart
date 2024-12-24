import 'package:get/get.dart';

import '../controllers/volume_feature_controller.dart';

class VolumeFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VolumeFeatureController>(
      () => VolumeFeatureController(),
    );
  }
}
