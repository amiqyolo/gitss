import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../camera_feature/controllers/camera_feature_controller.dart';

class CapturedImage extends StatelessWidget {
  final CameraFeatureController controller;

  const CapturedImage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final imagePath = controller.capturedImagePath.value;
      if (imagePath != null) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.file(File(imagePath)),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
