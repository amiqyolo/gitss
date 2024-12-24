import 'package:get/get.dart';

import '../controllers/device_info_feature_controller.dart';

class DeviceInfoFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeviceInfoFeatureController>(
      () => DeviceInfoFeatureController(),
    );
  }
}
