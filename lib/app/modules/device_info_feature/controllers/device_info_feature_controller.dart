import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:disk_space_2/disk_space_2.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DeviceInfoFeatureController extends GetxController {
  final RxString _platformVersion = 'Unknown'.obs;

  RxString get platformVersion => _platformVersion;
  final RxDouble _totalDiskSpace = 0.0.obs;
  final RxDouble _freeDiskSpace = 0.0.obs;
  final RxString _model = "Unknown".obs;
  final RxString _brand = "Unknown".obs;
  final RxString _manufacture = "Unknown".obs;

  RxDouble get totalDiskSpace => _totalDiskSpace;

  RxDouble get freeDiskSpace => _freeDiskSpace;

  RxString get model => _model;

  RxString get brand => _brand;

  RxString get manufacture => _manufacture;

  final _diskSpacePlugin = DiskSpace();

  Future<void> _initDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String model;
    String brand;
    String manufacture;

    try {
      final AndroidDeviceInfo androidDeviceInfo =
          await deviceInfoPlugin.androidInfo;

      model = androidDeviceInfo.model;
      brand = androidDeviceInfo.brand;
      manufacture = androidDeviceInfo.manufacturer;
    } on PlatformException {
      model = "";
      brand = "";
      manufacture = "";
    }

    _model.value = model;
    _brand.value = brand;
    _manufacture.value = manufacture;
  }

  Future<void> _initPlatformState() async {
    String platformVersion;
    double totalDiskSpace;
    double freeDiskSpace;
    // double freeDiskSpaceForPath;

    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _diskSpacePlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    totalDiskSpace = await DiskSpace.getTotalDiskSpace ?? 0.0;
    freeDiskSpace = await DiskSpace.getFreeDiskSpace ?? 0.0;

    _platformVersion.value = platformVersion;
    _totalDiskSpace.value = totalDiskSpace;
    _freeDiskSpace.value = freeDiskSpace;
    print(_totalDiskSpace / 1024);
    print(_freeDiskSpace / 1024);
    print(_freeDiskSpace / 1000);
  }

  Future<int> getTotalRAM() async {
    final memInfo = await File('/proc/meminfo').readAsString();
    final lines = memInfo.split('\n');

    for (var line in lines) {
      if (line.startsWith('MemTotal:')) {
        final parts = line.split(RegExp(r'\s+'));
        return int.parse(parts[1]) * 1024; // Convert KB to Bytes
      }
    }
    return 0;
  }

  @override
  void onInit() {
    super.onInit();
    _initDeviceInfo();
    _initPlatformState();
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
