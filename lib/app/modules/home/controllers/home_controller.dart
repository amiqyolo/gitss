import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gitss/app/models/home/menu_item.dart';

class HomeController extends GetxController {
  final RxList<MenuItem> homeMenus = [
    MenuItem(
      title: "Siap Inspeksi",
      description: "Data siap untuk diinspeksi",
      imageUrl: "assets/images/ready.svg",
      userCount: 100,
      backgroundColor: Colors.orange,
      iconBackgroundColor: Colors.orangeAccent,
    ),
    MenuItem(
      title: "Dalam Proses",
      description: "Data dalam proses",
      imageUrl: "assets/images/in_process.svg",
      userCount: 5,
      backgroundColor: Colors.blue,
      iconBackgroundColor: Colors.blueAccent,
    ),
    MenuItem(
      title: "Selesai",
      description: "Data selesai",
      imageUrl: "assets/images/completed.svg",
      userCount: 20,
      backgroundColor: Colors.green,
      iconBackgroundColor: Colors.greenAccent,
    ),
  ].obs; // with obs bcz if fetch from server can update ui realtime

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
