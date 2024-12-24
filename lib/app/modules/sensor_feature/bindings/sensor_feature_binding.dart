import 'package:get/get.dart';

import '../controllers/sensor_feature_controller.dart';

class SensorFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SensorFeatureController>(
      () => SensorFeatureController(),
    );
  }
}
