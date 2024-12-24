import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wifi_conncetion_feature_controller.dart';

class WifiConncetionFeatureView
    extends GetView<WifiConncetionFeatureController> {
  const WifiConncetionFeatureView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WiFi Status')),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Spacer(flex: 2),
          Text(
            'Active connection types:',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Obx(
              () => Text(
                "Device WiFi Support: ${controller.wifiSupport.value ? 'Support' : 'Not Support'}"),
          ),
          const Spacer(),
          Obx(
            () => ListView(
              shrinkWrap: true,
              children: List.generate(
                  controller.connectionStatus.length,
                      (index) => Center(
                    child: Text(
                      controller.connectionStatus[index].toString(),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  )),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        onPressed: () {
          controller.wifiSupport.value ? 'NORMAL' : 'TIDAK NORMAL';
          Get.back();
        },
        label: Obx(
          () => Text(controller.wifiSupport.value ? 'NORMAL' : 'TIDAK NORMAL', style: const TextStyle(
            color: Colors.white,
          ),),
        ),
      ),
    );
  }
}
