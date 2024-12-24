import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/vibration_feature_controller.dart';

class VibrationFeatureView extends GetView<VibrationFeatureController> {
  const VibrationFeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vibration Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(
              () => Text(
                  "Vibration Supported: ${controller.isVibrationSupported.value ? 'Yes' : 'No'}"),
            ),
            const SizedBox(height: 16),
            Obx(
              () => ElevatedButton(
                onPressed: controller.isVibrationSupported.value
                    ? controller.testVibration
                    : null,
                child: const Text("Test Vibration"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {
          controller.isVibrationSupported.value ? 'NORMAL' : 'TIDAK NORMAL';
          Get.back();
        },
        label: Obx(
          () => Text(
            controller.isVibrationSupported.value ? 'NORMAL' : 'TIDAK NORMAL',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
