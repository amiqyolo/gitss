import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/volume_feature_controller.dart';

class VolumeFeatureView extends GetView<VolumeFeatureController> {
  const VolumeFeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Volume Control')),
      body: Obx(
          () => Padding(
          padding: const EdgeInsets.all(16.0),
          child: controller.isVolumeControlAvailable.value
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Volume Control: Supported"),
                    Obx(
                      () => Slider(
                        value: controller.volume.value,
                        onChanged: (value) {
                          controller.updateVolume(value);
                        },
                        min: 0,
                        max: 1,
                        divisions: 10,
                        label: "${(controller.volume.value * 100).round()}%",
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        controller.playAudio();
                      },
                      child: Text('Test Speaker'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.stopAudio();
                      },
                      child: Text('Stop Speaker'),
                    ),
                  ],
                )
              : const Text(
                  "Volume Control: Not Supported",
                  style: TextStyle(fontSize: 18),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {
          controller.isVolumeControlAvailable.value ? 'NORMAL' : 'TIDAK NORMAL';
          Get.back();
        },
        label: Obx(
          () => Text(
            controller.isVolumeControlAvailable.value ? 'NORMAL' : 'TIDAK NORMAL',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
