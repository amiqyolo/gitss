import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/inspection_close_feature_controller.dart';

class InspectionCloseFeatureView
    extends GetView<InspectionCloseFeatureController> {
  const InspectionCloseFeatureView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(24.0),
                      )),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'GULABED',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'INSPEKTOR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 40.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'TOOLSET',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'TERIMA KASIH INSPEKTOR SUDAH MELAKUKAN INSPEKSI, DATAMU SUDAH TERSIMPAN DENGAN BAIK.'),
                    const SizedBox(height: 10.0),
                    Text(
                        'JAGA KEJUJURAN, TETAP SEMANGAT SEMOGA REJEKI LANCAR DAN BERKAH.'),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        Get.snackbar('Halo Dunia', 'UHUYYYYYYYYYYYYYYYYY');
                      },
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 10.0)),
                      ),
                      child: const Text(
                        'KELUAR, BERSIHKAN, & UNINSTALL',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
