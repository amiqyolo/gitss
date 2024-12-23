import 'package:get/get.dart';

import '../controllers/register_otp_verification_controller.dart';

class RegisterOtpVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterOtpVerificationController>(
      () => RegisterOtpVerificationController(),
    );
  }
}
