// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailtemp/src/utils/constants.dart';

import './components/Body.dart';
import './components/Header.dart';

class MailScreen extends StatelessWidget {
  const MailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: NColors.primary,
        statusBarIconBrightness: Brightness.light));
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Header(),
          SizedBox(height: NPadding.full * 2.5),
          Expanded(child: Body()),
        ],
      ),
    ));
  }
}
