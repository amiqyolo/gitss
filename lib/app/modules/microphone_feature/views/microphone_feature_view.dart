import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/microphone_feature_controller.dart';

class MicrophoneFeatureView extends GetView<MicrophoneFeatureController> {
  const MicrophoneFeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Microphone Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Obx(
              () => Column(
              children: [
                Text(controller.isMicrophoneAvailable.value
                      ? "Microphone Supported"
                      : "Microphone Not Supported"),
                if (controller.isMicrophoneAvailable.value)
                  Column(
                    children: [
                      Obx(
                        () => Text(
                          'Timer: ${controller.timer.value} seconds',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: controller.startRecording,
                        child: const Text('Start Recording'),
                      ),
                      ElevatedButton(
                        onPressed: controller.stopRecording,
                        child: const Text('Stop Recording'),
                      ),
                      Text('${controller.recordedFilePath.value}'),
                      ElevatedButton(
                        onPressed: controller.playRecording,
                        child: const Text('Play Recording'),
                      ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {
          controller.isMicrophoneAvailable.value ? 'NORMAL' : 'TIDAK NORMAL';
          Get.back();
        },
        label: Obx(
          () => Text(
            controller.isMicrophoneAvailable.value ? 'NORMAL' : 'TIDAK NORMAL',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
