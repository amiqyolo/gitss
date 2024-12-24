import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RootedFeatureController extends GetxController {
  static const platform = MethodChannel('com.shiffumediatek.gitss/main');

  //Initial Android root checker in set false value
  final RxBool _rootedCheck = false.obs;

  RxBool get rootedCheck => _rootedCheck;

  /// Memuat data sensor dari kelas SensorChecker
  Future<void> _checkRoot() async {
    bool rootedCheck;
    try {
      rootedCheck = await platform.invokeMethod<bool>('root_checker') as bool;
      print(
          "Android device is rooted: $rootedCheck"); // Tambahkan log untuk memeriksa data yang diterima
    } on PlatformException catch (e) {
      print('Error fetching sensor data: ${e.message}');
      rootedCheck = false;
    }
    // Mengonversi result ke Map<String, dynamic> agar bisa diakses dengan benar
    _rootedCheck.value = rootedCheck;
  }

  @override
  void onInit() {
    super.onInit();

    if (Platform.isAndroid) {
      _checkRoot();
    }
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
