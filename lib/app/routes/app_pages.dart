import 'package:get/get.dart';

import '../modules/camera_feature/bindings/camera_feature_binding.dart';
import '../modules/camera_feature/views/camera_feature_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/change_password_success/bindings/change_password_success_binding.dart';
import '../modules/change_password_success/views/change_password_success_view.dart';
import '../modules/device_info_feature/bindings/device_info_feature_binding.dart';
import '../modules/device_info_feature/views/device_info_feature_view.dart';
import '../modules/flashlight_feature/bindings/flashlight_feature_binding.dart';
import '../modules/flashlight_feature/views/flashlight_feature_view.dart';
import '../modules/forget_password/bindings/forget_password_binding.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/input_inspection/bindings/input_inspection_binding.dart';
import '../modules/input_inspection/views/input_inspection_view.dart';
import '../modules/inspection_close_feature/bindings/inspection_close_feature_binding.dart';
import '../modules/inspection_close_feature/views/inspection_close_feature_view.dart';
import '../modules/inspection_detail_feature/bindings/inspection_detail_feature_binding.dart';
import '../modules/inspection_detail_feature/views/inspection_detail_feature_view.dart';
import '../modules/inspection_result/bindings/inspection_result_binding.dart';
import '../modules/inspection_result/views/inspection_result_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/menus_inspection/bindings/menus_inspection_binding.dart';
import '../modules/menus_inspection/views/menus_inspection_view.dart';
import '../modules/microphone_feature/bindings/microphone_feature_binding.dart';
import '../modules/microphone_feature/views/microphone_feature_view.dart';
import '../modules/password_otp_verification/bindings/password_otp_verification_binding.dart';
import '../modules/password_otp_verification/views/password_otp_verification_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register_otp_verification/bindings/register_otp_verification_binding.dart';
import '../modules/register_otp_verification/views/register_otp_verification_view.dart';
import '../modules/register_success/bindings/register_success_binding.dart';
import '../modules/register_success/views/register_success_view.dart';
import '../modules/rooted_feature/bindings/rooted_feature_binding.dart';
import '../modules/rooted_feature/views/rooted_feature_view.dart';
import '../modules/sensor_feature/bindings/sensor_feature_binding.dart';
import '../modules/sensor_feature/views/sensor_feature_view.dart';
import '../modules/sim_card_feature/bindings/sim_card_feature_binding.dart';
import '../modules/sim_card_feature/views/sim_card_feature_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/touchscreen_feature/bindings/touchscreen_feature_binding.dart';
import '../modules/touchscreen_feature/views/touchscreen_feature_view.dart';
import '../modules/vibration_feature/bindings/vibration_feature_binding.dart';
import '../modules/vibration_feature/views/vibration_feature_view.dart';
import '../modules/volume_feature/bindings/volume_feature_binding.dart';
import '../modules/volume_feature/views/volume_feature_view.dart';
import '../modules/wifi_conncetion_feature/bindings/wifi_conncetion_feature_binding.dart';
import '../modules/wifi_conncetion_feature/views/wifi_conncetion_feature_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_OTP_VERIFICATION,
      page: () => const PasswordOtpVerificationView(),
      binding: PasswordOtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD_SUCCESS,
      page: () => const ChangePasswordSuccessView(),
      binding: ChangePasswordSuccessBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_OTP_VERIFICATION,
      page: () => const RegisterOtpVerificationView(),
      binding: RegisterOtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SUCCESS,
      page: () => const RegisterSuccessView(),
      binding: RegisterSuccessBinding(),
    ),
    GetPage(
      name: _Paths.INSPECTION_RESULT,
      page: () => const InspectionResultView(),
      binding: InspectionResultBinding(),
    ),
    GetPage(
      name: _Paths.INPUT_INSPECTION,
      page: () => const InputInspectionView(),
      binding: InputInspectionBinding(),
    ),
    GetPage(
      name: _Paths.MENUS_INSPECTION,
      page: () => const MenusInspectionView(),
      binding: MenusInspectionBinding(),
    ),
    GetPage(
      name: _Paths.CAMERA_FEATURE,
      page: () => const CameraFeatureView(),
      binding: CameraFeatureBinding(),
    ),
    GetPage(
      name: _Paths.SENSOR_FEATURE,
      page: () => const SensorFeatureView(),
      binding: SensorFeatureBinding(),
    ),
    GetPage(
      name: _Paths.TOUCHSCREEN_FEATURE,
      page: () => const TouchscreenFeatureView(),
      binding: TouchscreenFeatureBinding(),
    ),
    GetPage(
      name: _Paths.FLASHLIGHT_FEATURE,
      page: () => const FlashlightFeatureView(),
      binding: FlashlightFeatureBinding(),
    ),
    GetPage(
      name: _Paths.VOLUME_FEATURE,
      page: () => const VolumeFeatureView(),
      binding: VolumeFeatureBinding(),
    ),
    GetPage(
      name: _Paths.MICROPHONE_FEATURE,
      page: () => const MicrophoneFeatureView(),
      binding: MicrophoneFeatureBinding(),
    ),
    GetPage(
      name: _Paths.VIBRATION_FEATURE,
      page: () => const VibrationFeatureView(),
      binding: VibrationFeatureBinding(),
    ),
    GetPage(
      name: _Paths.WIFI_CONNCETION_FEATURE,
      page: () => const WifiConncetionFeatureView(),
      binding: WifiConncetionFeatureBinding(),
    ),
    GetPage(
      name: _Paths.ROOTED_FEATURE,
      page: () => const RootedFeatureView(),
      binding: RootedFeatureBinding(),
    ),
    GetPage(
      name: _Paths.SIM_CARD_FEATURE,
      page: () => const SimCardFeatureView(),
      binding: SimCardFeatureBinding(),
    ),
    GetPage(
      name: _Paths.DEVICE_INFO_FEATURE,
      page: () => const DeviceInfoFeatureView(),
      binding: DeviceInfoFeatureBinding(),
    ),
    GetPage(
      name: _Paths.INSPECTION_DETAIL_FEATURE,
      page: () => const InspectionDetailFeatureView(),
      binding: InspectionDetailFeatureBinding(),
    ),
    GetPage(
      name: _Paths.INSPECTION_CLOSE_FEATURE,
      page: () => const InspectionCloseFeatureView(),
      binding: InspectionCloseFeatureBinding(),
    ),
  ];
}
