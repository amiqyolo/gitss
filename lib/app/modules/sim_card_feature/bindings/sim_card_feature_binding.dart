import 'package:get/get.dart';

import '../controllers/sim_card_feature_controller.dart';

class SimCardFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SimCardFeatureController>(
      () => SimCardFeatureController(),
    );
  }
}
