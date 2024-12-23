import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/inspection/user_info.dart';

class InputInspectionController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController phoneTypeController;
  late TextEditingController cityController;
  late TextEditingController subDistrictController;
  late TextEditingController villageController;

  // Generated ID and dropdown status
  final RxString generatedId = "".obs;
  final RxString selectedStatus = "Siap Inspeksi".obs;

  // Dropdown options
  final List<String> statusOptions = ["Siap Inspeksi", "Dalam Proses", "Selesai"];

  // Generate ID
  void generateId() {
    final userInfo = UserInfo(
      name: nameController.text,
      phoneNumber: phoneController.text,
      phoneType: phoneTypeController.text,
      city: cityController.text,
      subDistrict: subDistrictController.text,
      village: villageController.text,
      backgroundIcon: '',
    );
    generatedId.value = generateUserId(userInfo);
  }

  // Simulasi Update Data ke Server
  Future<void> updateData() async {
    if (generatedId.value.isEmpty) {
      Get.snackbar("Error", "ID belum digenerate");
      return;
    }

    // Simulasi request server
    await Future.delayed(const Duration(seconds: 2));
    Get.snackbar("Success", "Data berhasil diupdate!");
  }

  String generateUserId(UserInfo userInfo) {
    return "${userInfo.name}_${userInfo.phoneNumber}_${userInfo.phoneType}_${userInfo.city}_${userInfo.subDistrict}_${userInfo.village}";
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    phoneTypeController = TextEditingController();
    cityController = TextEditingController();
    subDistrictController = TextEditingController();
    villageController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    phoneTypeController.dispose();
    cityController.dispose();
    subDistrictController.dispose();
    villageController.dispose();
    super.onClose();
  }
}
