import 'package:get/get.dart';

import '../controllers/input_inspection_controller.dart';

class InputInspectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InputInspectionController>(
      () => InputInspectionController(),
    );
  }
}
