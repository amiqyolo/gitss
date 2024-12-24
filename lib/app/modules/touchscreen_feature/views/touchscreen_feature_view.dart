import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/touch_tracker_painter.dart';
import '../controllers/touchscreen_feature_controller.dart';

class TouchscreenFeatureView extends GetView<TouchscreenFeatureController> {
  const TouchscreenFeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onPanUpdate: (details) {
          // Menambahkan titik sentuhan baru ke daftar
          RenderBox renderBox = context.findRenderObject() as RenderBox;
          controller.addPoint(renderBox.globalToLocal(details.globalPosition));
        },
        onPanEnd: (details) {
          // Menghapus jalur saat jari diangkat (opsional)
          // Jika ingin tetap mempertahankan titik sebelumnya, abaikan bagian ini
          // controller.points.value.clear();
          // controller.update();
        },
        child: GetBuilder<TouchscreenFeatureController>(
          builder: (controller) => CustomPaint(
            painter: TouchTrackerPainter(controller.points),
            size: Size.infinite,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {
          controller.points.isNotEmpty ? 'NORMAL' : 'TIDAK NORMAL';
          Get.back();
        },
        label: Obx(
          () => Text(
            controller.points.isNotEmpty ? 'NORMAL' : 'TIDAK NORMAL',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
