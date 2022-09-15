// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mailtemp/src/utils/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NColors.primary,
      padding: const EdgeInsets.all(NPadding.full),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.mail_outline,
            color: Colors.white,
            size: 38,
          ),
          const SizedBox(width: NPadding.half),
          Text(
            "Mail Temp".toUpperCase(),
            style: const TextStyle(
                fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
