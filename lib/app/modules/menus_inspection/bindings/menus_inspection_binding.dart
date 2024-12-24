import 'package:get/get.dart';

import '../controllers/menus_inspection_controller.dart';

class MenusInspectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenusInspectionController>(
      () => MenusInspectionController(),
    );
  }
}
