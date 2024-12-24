import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/rooted_feature_controller.dart';

class RootedFeatureView extends GetView<RootedFeatureController> {
  const RootedFeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Platform.isAndroid
              ? Text(
                  'Running on Android\n\n Root Checker: ${controller.rootedCheck.value}')
              : const Text('Running on iOS')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {
          controller.rootedCheck.value ? 'TIDAK NORMAL' : 'NORMAL';
          Get.back();
        },
        label: Obx(
          () => Text(
            controller.rootedCheck.value ? 'TIDAK NORMAL' : 'NORMAL',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
