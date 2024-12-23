import 'package:flutter/material.dart';

import '../models/inspection/user_info.dart';

class UserRepository {
  List<UserInfo> fetchUserInfo(String menuType) {
    // Simulasi data dinamis berdasarkan jenis menu
    return List.generate(10, (index) {
      return UserInfo(
        name: "$menuType User $index",
        phoneNumber: "0812345678$index",
        phoneType: "Type $index",
        city: "City $index",
        subDistrict: "SubDistrict $index",
        village: "Village $index",
        backgroundIcon: getColorBackground(menuType),
      );
    });
  }

  String getColorBackground(String menuType) {
    if (menuType.contains('Siap Inspeksi')) {
      return 'assets/images/user_ready.svg';
    } else if (menuType.contains('Dalam Proses')) {
      return 'assets/images/user_in_process.svg';
    } else {
      return 'assets/images/user_completed.svg';
    }
  }
}
