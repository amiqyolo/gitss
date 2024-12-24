import 'dart:ui';

import 'package:get/get.dart';

class TouchscreenFeatureController extends GetxController {
  final RxList<Offset> _points = RxList();

  List<Offset> get points => _points;

  void addPoint(Offset point) {
    _points.add(point); // Tambahkan titik baru
    update(); // Beri tahu UI bahwa data berubah
  }

  void clearPoints() {
    _points.clear(); // Kosongkan semua titik
    update(); // Beri tahu UI bahwa data berubah
  }

  @override
  void onInit() {
    super.onInit();
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
