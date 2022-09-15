// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';

const String BASE_URL = 'https://api.mail.tm';

/// All the usable characters for a random username/password
const String _charset =
    '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

class NColors {
  NColors._();

  static const Color primary = Color(0xFF0047AB);
  static Color secondary = const Color(0xFF0047AB).withOpacity(0.2);
  static const Color background = Color(0xFFEEF2FF);
  static const Color card = Color(0xFFCDDEFF);
  static const Color highLight = Color(0xFFFF5959);
  static const Color black = Color(0xFF191919);
  static const Color white = Color(0xFFFFFFFF);
}

class NPadding {
  NPadding._();

  static const double half = 8.0;
  static const double full = 16.0;
}

/// Generate a random string of [length] characters
String randomString(int length) {
  final random = Random.secure();
  final codeUnits = List<int>.generate(
    length,
    (index) => _charset.codeUnitAt(random.nextInt(_charset.length)),
  );
  return String.fromCharCodes(codeUnits);
}
