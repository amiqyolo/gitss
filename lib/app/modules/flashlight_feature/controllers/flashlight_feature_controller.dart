import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:torch_light/torch_light.dart';

class FlashlightFeatureController extends GetxController {
  final RxBool _isFlashOn = false.obs;
  final RxBool _isFlashSupported = false.obs;

  RxBool get isFlashOn => _isFlashOn;
  RxBool get isFlashSupported => _isFlashSupported;

  Future<void> _checkFlashSupport() async {
    try {
      final isSupported = await TorchLight.isTorchAvailable();
        _isFlashSupported.value = isSupported;
    } catch (e) {
        _isFlashSupported.value = false;
    }
  }

  Future<void> toggleFlash() async {
    if (!_isFlashSupported.value) return;

    try {
      if (_isFlashOn.value) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
        _isFlashOn.value = !_isFlashOn.value;
    } catch (e) {
      Get.snackbar('Torch error', e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    _checkFlashSupport();
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
