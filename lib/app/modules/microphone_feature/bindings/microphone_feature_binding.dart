import 'package:get/get.dart';

import '../controllers/microphone_feature_controller.dart';

class MicrophoneFeatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MicrophoneFeatureController>(
      () => MicrophoneFeatureController(),
    );
  }
}
