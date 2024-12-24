import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sensor_feature_controller.dart';

class SensorFeatureView extends GetView<SensorFeatureController> {
  const SensorFeatureView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sensors')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Available Sensors',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.availableSensors.length,
                    itemBuilder: (context, index) {
                      return _buildSensorCard(
                        controller.availableSensors[index],
                        true,
                      );
                    },
                  ),
                ),
                const Divider(height: 32),
                const Text(
                  'Unavailable Sensors',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.unavailableSensors.length,
                    itemBuilder: (context, index) {
                      return _buildSensorCard(
                        controller.unavailableSensors[index],
                        false,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget _buildSensorCard(String sensorName, bool isAvailable) {
    return Card(
      child: ListTile(
        title: Text(sensorName),
        subtitle: Text(isAvailable ? 'Available' : 'Unavailable'),
        leading: Icon(
          isAvailable ? Icons.check_circle : Icons.cancel,
          color: isAvailable ? Colors.green : Colors.red,
        ),
        trailing: TextButton(
          onPressed: () {
            controller.updateResult(
              sensorName,
              isAvailable ? 'NORMAL' : 'TIDAK NORMAL',
            );
          },
          child: Text(isAvailable ? 'NORMAL' : 'TIDAK NORMAL'),
        ),
      ),
    );
  }
}
