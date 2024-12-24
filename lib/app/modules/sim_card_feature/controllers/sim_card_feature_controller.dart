import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SimCardFeatureController extends GetxController {
  static const platform = MethodChannel('com.shiffumediatek.gitss/main');
  final RxString _simCardStatus = 'Unknown'.obs;
  final RxBool _checkNormal = false.obs;

  RxString get simCardStatus => _simCardStatus;

  RxBool get checkNormal => _checkNormal;

  Future<void> _checkPermissionAndSimSlots() async {
    if (await _requestPermission()) {
      try {
        final int simCount = await platform.invokeMethod('check_sim_slots');

        _checkNormal.value = true;
        _simCardStatus.value = "This device has $simCount SIM card slot(s).";
      } catch (e) {
        _checkNormal.value = false;
        _simCardStatus.value = "Failed to get SIM slot information: $e";
      }
    } else {
      _checkNormal.value = false;
      _simCardStatus.value = "SIM card permissions denied.";
    }
  }

  Future<bool> _requestPermission() async {
    if (Platform.isAndroid) {
      if (Platform.version.contains("30") || Platform.version.contains("31")) {
        // API 30+ : Request READ_PHONE_NUMBERS permission
        var status = await Permission.phone.request();
        return status.isGranted;
      } else {
        // API <30: Request READ_PHONE_STATE permission
        var status = await Permission.phone.request();
        return status.isGranted;
      }
    }
    return false; // Default untuk platform non-Android
  }

  @override
  void onInit() {
    super.onInit();
    _checkPermissionAndSimSlots();
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
