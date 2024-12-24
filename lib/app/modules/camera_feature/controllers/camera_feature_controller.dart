import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class CameraFeatureController extends GetxController {
  CameraController? cameraController;
  final RxBool isFrontCameraSupported = false.obs;
  final RxBool isBackCameraSupported = false.obs;
  final isCameraInitialized = false.obs;
  final RxnString capturedImagePath = RxnString();

  Future<void> _checkCameraSupport() async {
    final cameras = await availableCameras();

    isFrontCameraSupported.value = cameras
        .any((camera) => camera.lensDirection == CameraLensDirection.front);
    isBackCameraSupported.value = cameras
        .any((camera) => camera.lensDirection == CameraLensDirection.back);
  }

  Future<void> initializeCamera(CameraLensDirection lensDirection) async {
    // Dispose old controller safely
    if (cameraController != null) {
      await cameraController?.dispose();
      cameraController = null;
    }

    final cameras = await availableCameras();
    final camera = cameras.firstWhere(
          (camera) => camera.lensDirection == lensDirection,
      orElse: () => throw Exception('No camera found'),
    );

    cameraController = CameraController(camera, ResolutionPreset.medium);
    try {
      await cameraController!.initialize();
      isCameraInitialized.value = true; // Update reaktif
      capturedImagePath.value = null; // Reset captured image path
    } catch (e) {
      isCameraInitialized.value = false; // Update reaktif
      Get.snackbar('Error', 'Failed to initialize camera: $e');
    }
  }

  Future<void> takePicture() async {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return;
    }

    final Directory directory = await getApplicationDocumentsDirectory();
    final String imagePath =
        '${directory.path}/captured_image_${DateTime.now().millisecondsSinceEpoch}.jpg';

    try {
      final XFile? file = await cameraController?.takePicture();
      await file?.saveTo(imagePath);

      capturedImagePath.value = imagePath;

      Get.snackbar('Success', 'Image saved to $imagePath');
    } catch (e) {
      Get.snackbar('Error', 'Failed to capture image: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    _checkCameraSupport();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
