import 'package:get/get.dart';

import '../controllers/inspection_close_feature_controller.dart';

class InspectionCloseFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InspectionCloseFeatureController>(
      () => InspectionCloseFeatureController(),
    );
  }
}
