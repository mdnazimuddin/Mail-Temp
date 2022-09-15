// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mailtemp/src/utils/constants.dart';

import './components/Body.dart';
import './components/Header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: NColors.primary,
        statusBarIconBrightness: Brightness.light));
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: const [
          Header(),
          Expanded(child: Body()),
        ],
      ),
    ));
  }
}
