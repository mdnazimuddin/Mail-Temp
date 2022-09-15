// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mailtemp/src/route/routes.dart';
import 'package:mailtemp/src/utils/constants.dart';

class SplashController extends GetxController {
  double customOpacity = 0;

  int _time = 3;

  @override
  onInit() {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: NColors.background,
        statusBarIconBrightness: Brightness.dark));
    startTimer();
  }

  changeOpacity() {
    customOpacity = 1;
    update();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_time == 0) {
          timer.cancel();
          // navigate home
          Get.offAllNamed(RouteClass.getHomeRoute());
        } else {
          _time--;
        }
      },
    );
    update();
  }
}
