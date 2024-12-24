import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gitss/app/routes/app_pages.dart';

import '../controllers/inspection_detail_feature_controller.dart';

class InspectionDetailFeatureView
    extends GetView<InspectionDetailFeatureController> {
  const InspectionDetailFeatureView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(24),
                      bottomLeft: Radius.circular(8),
                    ),
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ],
          ),
          ListView(
            padding: EdgeInsets.all(20.0),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'NAMA',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Pelanggan',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'TELP/HP',
                          style: TextStyle(
                            color: Colors.blue,
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
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'SERI HP',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "SEri HP",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'KODE',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'SUMSANG',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'INSPEKTOR',
                          style: TextStyle(
                            color: Colors.blue,
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
                            color: Colors.blue,
                            fontWeight: FontWeight.normal,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Text(
                'HASIL INSPEKSI',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.0),
              // Obx(
              //       () {
              //     return ListView(
              //       physics: BouncingScrollPhysics(),
              //       shrinkWrap: true,
              //       children: controller.inspectionResults.entries.map((entry) {
              //         return Row(
              //           children: [
              //             Expanded(
              //               child: Text(
              //                 entry.key,
              //                 style: TextStyle(
              //                   color: Colors.blue,
              //                   fontSize: 16,
              //                 ),
              //               ),
              //             ),
              //             Expanded(
              //               child: Text(
              //                 entry.value,
              //                 style: TextStyle(
              //                   color: Colors.blue,
              //                   fontSize: 16,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         );
              //       }).toList(),
              //     );
              //   },
              // ),
              SizedBox(height: 50.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14.0),),
                ),
                onPressed: () {
                  Get.offAllNamed(Routes.INSPECTION_CLOSE_FEATURE);
                },
                child: Text(
                  'KIRIM HASIL INSPEKSI',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
