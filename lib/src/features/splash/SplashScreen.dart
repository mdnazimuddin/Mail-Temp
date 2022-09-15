// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailtemp/src/features/splash/controller/SplashController.dart';
import 'package:mailtemp/src/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<SplashController>(
            init: SplashController(),
            builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 25, end: 120),
                    duration: const Duration(seconds: 2),
                    curve: Curves.bounceOut,
                    onEnd: (() => controller.changeOpacity()),
                    builder: ((context, double size, child) => Icon(
                          Icons.mail_outline,
                          color: NColors.primary,
                          size: size,
                        )),
                  ),
                  AnimatedOpacity(
                    opacity: controller.customOpacity,
                    duration: const Duration(seconds: 1),
                    child: Text(
                      'Mail Temp'.toUpperCase(),
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
