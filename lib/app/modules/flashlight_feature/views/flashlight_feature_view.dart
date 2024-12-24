import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/flashlight_feature_controller.dart';

class FlashlightFeatureView extends GetView<FlashlightFeatureController> {
  const FlashlightFeatureView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: controller.isFlashSupported.value
            ? IconButton(
          icon: Icon(controller.isFlashOn.value ? Icons.flash_on : Icons.flash_off),
          iconSize: 64.0,
          onPressed: controller.toggleFlash,
        )
            : const Text(
          "Flashlight not supported on this device",
          style: TextStyle(fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {
          controller.isFlashSupported.value ? 'NORMAL' : 'TIDAK NORMAL';
          Get.back();
        },
        label: Text(
          controller.isFlashSupported.value ? 'NORMAL' : 'TIDAK NORMAL',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
