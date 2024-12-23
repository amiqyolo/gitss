import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gitss/app/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Gitss',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: Routes.SPLASH_SCREEN,
    getPages: AppPages.routes,
  ));
}