import 'package:get/get.dart';

import '../controllers/inspection_detail_feature_controller.dart';

class InspectionDetailFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InspectionDetailFeatureController>(
      () => InspectionDetailFeatureController(),
    );
  }
}
