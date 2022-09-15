// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:mailtemp/src/features/mail/controllers/MailController.dart';
import 'package:mailtemp/src/features/mail/widgets/CircleInitial.dart';
import 'package:mailtemp/src/utils/constants.dart';
import 'package:mailtemp/src/utils/functions.dart';

class MailDetailsScreen extends StatelessWidget {
  MailDetailsScreen({Key? key}) : super(key: key);
  final controller = Get.put(MailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outlined)),
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.mail_outline)),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(NPadding.half),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.message.subject!,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade900),
            ),
            const SizedBox(height: NPadding.full),
            Row(
              children: [
                CircleInitial(text: controller.message.from!['name']),
                const SizedBox(width: NPadding.half),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.message.from!['name'],
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${controller.message.createdAt!.day} ${getMonth(controller.message.createdAt!.month, isFullName: true)}",
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 12,
                                fontWeight: FontWeight.normal),
                            children: const [
                              TextSpan(
                                text: "to me",
                              ),
                              WidgetSpan(
                                  alignment: PlaceholderAlignment.bottom,
                                  child: Icon(Icons.arrow_drop_down_outlined,
                                      size: 18))
                            ]),
                      ),
                    ),
                  ],
                )),
              ],
            ),
            const SizedBox(height: NPadding.full),
            HtmlWidget(controller.message.intro!),
          ],
        ),
      )),
    );
  }
}
