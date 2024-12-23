import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/inspection_result_controller.dart';

class InspectionResultView extends GetView<InspectionResultController> {
  const InspectionResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100.0,
        backgroundColor: Colors.transparent,
        elevation: 20.0,
        flexibleSpace: ClipPath(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  controller.menuItem.iconBackgroundColor,
                  controller.menuItem.backgroundColor,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SvgPicture.asset(
                    'assets/images/gitss_logo.svg',
                    semanticsLabel: 'Gitss Logo',
                    height: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.menuItem.title,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Row(
                        children: [
                          const Icon(Icons.person,
                              size: 16, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            "${controller.menuItem.userCount}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () {
          if (controller.userList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            padding: EdgeInsets.only(top: 12.0),
            itemCount: controller.userList.length,
            itemBuilder: (context, index) {
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        controller.userList[index].backgroundIcon,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nama\t: ${controller.userList[index].name}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "No HP\t: ${controller.userList[index].phoneNumber}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              "Tipe HP\t: ${controller.userList[index].phoneType}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              "Kota/Kab\t: ${controller.userList[index].city}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              "Kecamatan\t: ${controller.userList[index].subDistrict}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              "Kelurahan\t: ${controller.userList[index].village}",
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
