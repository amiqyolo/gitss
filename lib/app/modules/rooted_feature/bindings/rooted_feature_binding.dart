import 'package:get/get.dart';

import '../controllers/rooted_feature_controller.dart';

class RootedFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootedFeatureController>(
      () => RootedFeatureController(),
    );
  }
}
