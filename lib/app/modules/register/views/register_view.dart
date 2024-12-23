import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:gitss/app/modules/login/views/login_view.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
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
                  const Text(
                    'Selamat Datang Kembali',
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
                        const Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        TextField(
                          autofocus: false,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF6D6D85),
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: const InputDecoration(
                            // labelText: 'Email',
                            hintText: 'Masukkan Email Kamu',
                            // prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            // contentPadding:
                            // EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          // maxLength: 20,
                          onChanged: (text) {
                            print('Entered value: $text');
                          },
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Nama',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        TextField(
                          autofocus: false,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF6D6D85),
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: const InputDecoration(
                            // label: Text('Password'),
                            // labelText: 'Password',
                            hintText: 'Masukkan Nama Kamu',
                            // prefixIcon: Icon(Icons.key),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            // contentPadding:
                            // EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          // maxLength: 20,
                          onChanged: (text) {
                            print('Entered value: $text');
                          },
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        TextField(
                          autofocus: false,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF6D6D85),
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: const InputDecoration(
                            // label: Text('Password'),
                            // labelText: 'Password',
                            hintText: 'Masukkan Password Kamu',
                            // prefixIcon: Icon(Icons.key),
                            suffixIcon: Icon(Icons.visibility),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            // contentPadding:
                            // EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          // maxLength: 20,
                          onChanged: (text) {
                            print('Entered value: $text');
                          },
                        ),
                        const SizedBox(height: 40.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF95BD44),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            minimumSize: const Size(double.infinity, 48),
                          ),
                          onPressed: () {
                            // Get.to(() => RegisterOtpVerificationScreen());
                          },
                          child: const Text(
                            'Daftar',
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
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Sudah Punya Akun?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      InkWell(
                        onTap: () {
                          Get.to(() => LoginView());
                        },
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Login disini',
                            style: TextStyle(
                              color: Color(0xFFE99F48),
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
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
