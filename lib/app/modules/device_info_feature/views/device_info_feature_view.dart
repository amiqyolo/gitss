import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/device_info_feature_controller.dart';

class DeviceInfoFeatureView extends GetView<DeviceInfoFeatureController> {
  const DeviceInfoFeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Informasi Perangkat',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                FutureBuilder<int>(
                  future: controller.getTotalRAM(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    final totalRAM = snapshot.data ?? 0;
                    final ramInGB =
                        (totalRAM / (1024 * 1024 * 1024)).toStringAsFixed(2);

                    return Column(
                      children: [
                        Text('Manufacture: ${controller.manufacture.value}'),
                        Text('Brand: ${controller.brand.value}'),
                        Text('Model: ${controller.model.value}'),
                        Text('Total RAM: $ramInGB GB'),
                        Text('Free RAM: $ramInGB GB'),
                        Text('Available RAM: $ramInGB GB'),
                        const SizedBox(height: 20),
                        Text('Running on: ${controller.platformVersion.value}'),
                        Text(
                            'Total disk space: ${(controller.totalDiskSpace.value / 1000).toStringAsFixed(2)} GB'),
                        Text(
                            'Free disk space: ${(controller.freeDiskSpace.value / 1000).toStringAsFixed(2)} GB'),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
