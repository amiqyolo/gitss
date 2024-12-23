import 'package:get/get.dart';

import '../controllers/inspection_result_controller.dart';

class InspectionResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InspectionResultController>(
      () => InspectionResultController(),
    );
  }
}
