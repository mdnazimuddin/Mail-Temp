import 'dart:math';

import 'package:flutter/material.dart';

String getInitials(String string, {int? limitTo}) {
  var buffer = StringBuffer();

  if (string.isEmpty) return string;

  var wordList = string.trim().split(' ');

  // Take first character if string is a single word
  // if (wordList.length <= 1) return string.characters.first;
  if (wordList.length <= 1) {
    if (string.length == 1) {
      return "${string[0].toUpperCase()} ";
    } else {
      return string[0].toUpperCase() + string[1].toUpperCase();
    }
  }

  /// Fallback to actual word count if
  /// expected word count is greater
  if (limitTo != null && limitTo > wordList.length) {
    for (var i = 0; i < wordList.length; i++) {
      buffer.write(wordList[i][0].toUpperCase());
    }
    return buffer.toString();
  }

  // Handle all other cases
  for (var i = 0; i < (limitTo ?? wordList.length); i++) {
    buffer.write(wordList[i][0]);
  }
  return buffer.toString();
}

Color rendomColor() {
  List<Color> colors = [
    Colors.blue,
    Colors.grey,
    Colors.green,
    Colors.black,
    Colors.amber,
    Colors.orange,
    Colors.brown,
    Colors.cyan,
    Colors.deepPurple,
    Colors.indigo
  ];
  return colors[Random().nextInt(10)];
}

String getMonth(dynamic num, {bool isFullName = false}) {
  if (num == '01' || num == '1' || num == 1) {
    return isFullName ? "January" : "Jan";
  } else if (num == '02' || num == '2' || num == 2) {
    return isFullName ? "February" : "Feb";
  } else if (num == '03' || num == '3' || num == 3) {
    return isFullName ? "March" : "March";
  } else if (num == '04' || num == '4' || num == 4) {
    return isFullName ? "April" : "April";
  } else if (num == '05' || num == '5' || num == 5) {
    return isFullName ? "May" : "May";
  } else if (num == '06' || num == '6' || num == 6) {
    return isFullName ? "June" : "Jun";
  } else if (num == '07' || num == '7' || num == 7) {
    return isFullName ? "July" : "July";
  } else if (num == '08' || num == '8' || num == 8) {
    return isFullName ? "August" : "Aug";
  } else if (num == '09' || num == '9' || num == 9) {
    return isFullName ? "September" : "Sep";
  } else if (num == '10' || num == 10) {
    return isFullName ? "October" : "Oct";
  } else if (num == '11' || num == 11) {
    return isFullName ? "November" : "Nav";
  } else if (num == '12' || num == 12) {
    return isFullName ? "December" : "Dec";
  } else {
    return "NoN";
  }
}
