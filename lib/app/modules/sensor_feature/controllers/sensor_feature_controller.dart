import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SensorFeatureController extends GetxController {
  static const platform = MethodChannel('com.shiffumediatek.gitss/main');

  // State reaktif
  var sensorData = <String, Map<String, bool>>{}.obs;
  var availableSensors = <String>[].obs;
  var unavailableSensors = <String>[].obs;
  var isLoading = true.obs;

  Future<void> fetchSensorData() async {
    try {
      final result =
      await platform.invokeMethod<Map<dynamic, dynamic>>('sensors_available');
      final convertedData = _convertMap(result ?? {});
      sensorData.value = convertedData;

      // Update available and unavailable sensors
      availableSensors.value = convertedData.entries
          .where((entry) => entry.value['available'] == true)
          .map((entry) => entry.key)
          .toList();

      unavailableSensors.value = convertedData.entries
          .where((entry) => entry.value['available'] == false)
          .map((entry) => entry.key)
          .toList();

      isLoading.value = false;
    } on PlatformException catch (e) {
      print('Error fetching sensor data: ${e.message}');
      sensorData.clear();
      availableSensors.clear();
      unavailableSensors.clear();
      isLoading.value = true;
    }
  }

  Map<String, Map<String, bool>> _convertMap(Map<dynamic, dynamic> originalMap) {
    final Map<String, Map<String, bool>> convertedMap = {};
    originalMap.forEach((key, value) {
      if (key is String && value is Map) {
        final boolMap = <String, bool>{};
        value.forEach((k, v) {
          if (k is String && v is bool) {
            boolMap[k] = v;
          }
        });
        convertedMap[key] = boolMap;
      }
    });
    return convertedMap;
  }

  void updateResult(String sensorName, String status) {
    Get.snackbar(sensorName, status);
  }

  @override
  void onInit() {
    super.onInit();
    fetchSensorData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
