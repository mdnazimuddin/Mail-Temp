import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailtemp/src/route/routes.dart';
import 'package:mailtemp/src/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mail Temp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: NColors.primary,
          secondary: NColors.secondary,
        ),
      ),
      initialRoute: '/',
      getPages: RouteClass.routes,
    );
  }
}
