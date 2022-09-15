// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mailtemp/src/features/home/models/Account.dart';
import 'package:mailtemp/src/utils/constants.dart';

import '../controllers/MailController.dart';
import '../widgets/MailCard.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MailController>(
        init: MailController(),
        builder: (controller) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  color: NColors.primary,
                  height: 175,
                  padding: const EdgeInsets.all(NPadding.full),
                  child: Column(
                    children: [
                      Row(
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
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const SizedBox(height: NPadding.full),
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius:
                              BorderRadius.circular(NPadding.half / 2),
                        ),
                        padding: const EdgeInsets.all(NPadding.half),
                        child: DropdownButton<Account>(
                          // Initial Value
                          value: controller.account,
                          alignment: Alignment.center, isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down_outlined,
                              color: Colors.white),
                          underline: Container(),
                          dropdownColor: NColors.primary,

                          // Array list of items
                          items: controller.accounts.map((Account item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item.address,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey.shade100),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) =>
                              controller.selectAccount(newValue!),
                        ),
                      ),
                    ],
                  )),
              Positioned(
                  top: 125,
                  left: NPadding.full,
                  right: NPadding.full,
                  child: Row(
                    children: [
                      Expanded(
                        child: MailCard(
                          icon: Icons.file_copy_outlined,
                          onPress: () {
                            Clipboard.setData(ClipboardData(
                                text: controller.account.address));
                          },
                          title: 'Copy',
                        ),
                      ),
                      const SizedBox(
                        width: NPadding.half / 2,
                      ),
                      Expanded(
                        child: MailCard(
                          icon: Icons.refresh,
                          onPress: () {
                            controller.getAllMessage();
                          },
                          title: 'Refresh',
                        ),
                      ),
                      const SizedBox(
                        width: NPadding.half / 2,
                      ),
                      Expanded(
                        child: MailCard(
                          icon: Icons.add_box_outlined,
                          onPress: () => Get.back(),
                          title: 'New',
                        ),
                      ),
                      const SizedBox(
                        width: NPadding.half / 2,
                      ),
                      Expanded(
                        child: MailCard(
                          icon: Icons.delete_outline,
                          onPress: () => controller.delete(),
                          title: 'Delete',
                        ),
                      ),
                    ],
                  ))
            ],
          );
        });
  }
}
