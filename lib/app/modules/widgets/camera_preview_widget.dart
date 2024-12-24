import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../camera_feature/controllers/camera_feature_controller.dart';

class CameraPreviewWidget extends StatelessWidget {
  final CameraFeatureController controller;

  const CameraPreviewWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCameraInitialized.value) {
        return AspectRatio(
          aspectRatio: controller.cameraController!.value.aspectRatio,
          child: CameraPreview(controller.cameraController!),
        );
      } else {
        return const Center(child: Text('Initializing camera...'));
      }
    });
  }
}
