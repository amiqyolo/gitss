import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

class VibrationFeatureController extends GetxController {
  final RxBool _isVibrationSupported = false.obs;

  RxBool get isVibrationSupported => _isVibrationSupported;

  Future<void> _checkVibrationSupport() async {
    final isSupported = await Vibration.hasVibrator() ?? false;
      _isVibrationSupported.value = isSupported;
  }

  Future<void> testVibration() async {
    if (_isVibrationSupported.value) {
      await Vibration.vibrate(duration: 1000);
    }
  }

  @override
  void onInit() {
    super.onInit();
    _checkVibrationSupport();
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
