// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:mailtemp/src/utils/functions.dart';

Widget CircleInitial({required text, limit = 2}) {
  return Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
        color: rendomColor(), borderRadius: BorderRadius.circular(50)),
    alignment: Alignment.center,
    child: Text(
      getInitials(text, limitTo: limit),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
  );
}
