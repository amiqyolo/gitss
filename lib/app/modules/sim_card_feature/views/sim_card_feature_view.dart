import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sim_card_feature_controller.dart';

class SimCardFeatureView extends GetView<SimCardFeatureController> {
  const SimCardFeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(() => Text(controller.simCardStatus.value)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.checkNormal.value ? 'NORMAL' : 'TIDAK NORMAL';
          Get.back();
        },
        label: Obx(() =>
            Text(controller.checkNormal.value ? 'NORMAL' : 'TIDAK NORMAL')),
      ),
    );
  }
}
