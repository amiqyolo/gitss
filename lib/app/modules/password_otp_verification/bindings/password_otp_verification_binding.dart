import 'package:get/get.dart';

import '../controllers/password_otp_verification_controller.dart';

class PasswordOtpVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordOtpVerificationController>(
      () => PasswordOtpVerificationController(),
    );
  }
}
