import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitss/app/modules/camera_feature/views/camera_feature_view.dart';
import 'package:gitss/app/routes/app_pages.dart';

import '../../widgets/feature_button.dart';
import '../controllers/menus_inspection_controller.dart';

class MenusInspectionView extends GetView<MenusInspectionController> {
  const MenusInspectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'NAMA',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'PElanggan',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'TELP/HP',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '08636567384',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'SERI HP',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '086',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'KODE',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '763',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'INSPEKTOR',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'RUDI',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Device Features',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    FeatureButton(
                      label: 'Access Camera',
                      onTap: () => Get.toNamed(Routes.CAMERA_FEATURE),
                    ),
                    FeatureButton(
                      label: 'Access Sensors',
                      onTap: () => Get.toNamed(Routes.SENSOR_FEATURE),
                    ),
                    FeatureButton(
                      label: 'Touch Screen',
                      onTap: () => Get.toNamed(Routes.TOUCHSCREEN_FEATURE),
                    ),
                    FeatureButton(
                      label: 'Access Flashlight',
                      onTap: () => Get.to(() => const MenusInspectionView()),
                    ),
                    FeatureButton(
                      label: 'Access Device Info',
                      onTap: () => Get.to(() => const MenusInspectionView()),
                    ),
                    FeatureButton(
                      label: 'Access Volume',
                      onTap: () => Get.to(() => const MenusInspectionView()),
                    ),
                    FeatureButton(
                      label: 'Access Microphone',
                      onTap: () => Get.to(() => const MenusInspectionView()),
                    ),
                    FeatureButton(
                      label: 'Access Vibration',
                      onTap: () => Get.to(() => const MenusInspectionView()),
                    ),
                    FeatureButton(
                      label: 'Access WI-FI Connectivity',
                      onTap: () => Get.to(() => const MenusInspectionView()),
                    ),
                    FeatureButton(
                      label: 'Access Android Rooted',
                      onTap: () => Get.to(() => const MenusInspectionView()),
                    ),
                    FeatureButton(
                      label: 'Access Sim Card',
                      onTap: () => Get.to(() => const MenusInspectionView()),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      padding: WidgetStatePropertyAll(EdgeInsets.all(10.0)),
                    ),
                    onPressed: () {
                      // Get.to(() => ResultsScreen());
                    },
                    child: const Text(
                      'KIRIM HASIL INSPEKSI',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
