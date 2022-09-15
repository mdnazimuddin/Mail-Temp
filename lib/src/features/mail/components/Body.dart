// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailtemp/src/features/mail/controllers/MailController.dart';
import 'package:mailtemp/src/features/mail/models/Message.dart';
import 'package:mailtemp/src/features/mail/widgets/MessageCard.dart';
import 'package:mailtemp/src/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MailController>(
        init: MailController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(NPadding.half),
                child: Text(
                  "Inbox".toUpperCase(),
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                      letterSpacing: .8,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    if (controller.messages.isEmpty) {
                      return const Center(
                        child: Text("Inbox Empty"),
                      );
                    }
                    Message message = controller.messages[index];
                    return MessageCard(message: message);
                  },
                ),
              )
            ],
          );
        });
  }
}
