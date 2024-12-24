import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../widgets/camera_preview_widget.dart';
import '../../widgets/captured_image.dart';
import '../controllers/camera_feature_controller.dart';

class CameraFeatureView extends GetView<CameraFeatureController> {
  const CameraFeatureView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a picture'),
      ),
      body: ListView(
        children: [
          CameraPreviewWidget(controller: controller),
          CapturedImage(controller: controller),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => controller.initializeCamera(CameraLensDirection.front),
            child: const Text('Open Front Camera'),
          ),
          Obx(() => ElevatedButton(
            onPressed: () => Get.snackbar(
              'KAMERA DEPAN',
              controller.isFrontCameraSupported.value ? 'NORMAL' : 'TIDAK NORMAL',
            ),
            child: Text(controller.isFrontCameraSupported.value ? 'NORMAL' : 'TIDAK NORMAL'),
          )),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => controller.initializeCamera(CameraLensDirection.back),
            child: const Text('Open Back Camera'),
          ),
          Obx(() => ElevatedButton(
            onPressed: () => Get.snackbar(
              'KAMERA BELAKANG',
              controller.isBackCameraSupported.value ? 'NORMAL' : 'TIDAK NORMAL',
            ),
            child: Text(controller.isBackCameraSupported.value ? 'NORMAL' : 'TIDAK NORMAL'),
          )),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => controller.takePicture(),
            child: const Text('Capture Image'),
          ),
        ],
      ),
    );
  }
}
