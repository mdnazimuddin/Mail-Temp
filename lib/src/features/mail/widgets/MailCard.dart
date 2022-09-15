// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:mailtemp/src/utils/constants.dart';

class MailCard extends StatelessWidget {
  IconData icon;
  String title;
  VoidCallback onPress;

  MailCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        color: NColors.card,
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(NPadding.full),
          child: Column(
            children: [
              Icon(
                icon,
                color: NColors.primary,
                size: 20,
              ),
              const SizedBox(height: NPadding.half / 2),
              Text(
                title,
                style: const TextStyle(
                    color: NColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
