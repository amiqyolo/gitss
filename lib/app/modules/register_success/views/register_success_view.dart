import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:gitss/app/modules/login/views/login_view.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_success_controller.dart';

class RegisterSuccessView extends GetView<RegisterSuccessController> {
  const RegisterSuccessView({super.key});
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(90, 196, 161, 1),
            Color.fromRGBO(77, 171, 196, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/images/gitss_logo.svg',
                    semanticsLabel: 'Gitss Logo',
                    height: 76,
                  ),
                  const SizedBox(height: 36.0),
                  SvgPicture.asset(
                    'assets/images/complete_change_password.svg',
                    semanticsLabel: 'Gitss Logo',
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(height: 36.0),
                  const Text(
                    'Pendaftaran Berhasil',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.7),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Silahkan masuk untuk mengakses akun Anda',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.6,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF95BD44),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            minimumSize: const Size(double.infinity, 48),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.LOGIN);
                          },
                          child: const Text(
                            'Kembali Ke LOGIN',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
