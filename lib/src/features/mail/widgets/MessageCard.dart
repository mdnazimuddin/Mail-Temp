// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailtemp/src/features/mail/controllers/MailController.dart';
import 'package:mailtemp/src/features/mail/models/Message.dart';
import 'package:mailtemp/src/features/mail/widgets/CircleInitial.dart';
import 'package:mailtemp/src/utils/constants.dart';
import 'package:mailtemp/src/utils/functions.dart';

class MessageCard extends StatelessWidget {
  MessageCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Message message;
  final controller = Get.put(MailController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.setMessage(message),
      child: Container(
        padding: const EdgeInsets.all(NPadding.half),
        child: Row(
          children: [
            CircleInitial(text: message.from!['name']),
            const SizedBox(width: NPadding.half),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      message.from!['name'],
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${message.createdAt!.day} ${getMonth(message.createdAt!.month)}",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Text(
                  message.subject!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  message.intro!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
