// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailtemp/src/features/home/controllers/HomeController.dart';
import 'package:mailtemp/src/features/mail/controllers/MailController.dart';
import 'package:mailtemp/src/route/routes.dart';
import 'package:mailtemp/src/utils/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(NPadding.full),
              child: Column(
                children: [
                  const SizedBox(height: NPadding.full),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(NPadding.half / 2),
                    ),
                    child: TextField(
                      controller: controller.username,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 0),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        hintText: "Enter username",
                        hintStyle: TextStyle(
                            color: Colors.grey.shade600, fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: NPadding.half),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(NPadding.half / 2),
                    ),
                    child: TextField(
                        controller: controller.password,
                        keyboardType: TextInputType.text,
                        obscureText: controller.obscureText,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintText: "Enter password",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade600, fontSize: 14),
                          suffixIcon: IconButton(
                            icon: Icon(controller.obscureText
                                ? Icons.remove_red_eye_rounded
                                : Icons.remove_red_eye_outlined),
                            onPressed: (() => controller.changeObscure()),
                          ),
                        )),
                  ),
                  const SizedBox(height: NPadding.half),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(NPadding.half / 2),
                    ),
                    padding: const EdgeInsets.all(NPadding.half),
                    child: DropdownButton(
                      // Initial Value
                      value: controller.selectedDomain,
                      alignment: Alignment.center, isExpanded: true,
                      underline: Container(),

                      // Array list of items
                      items: controller.domainNames.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade800),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValue) =>
                          controller.selectDomain(newValue),
                    ),
                  ),
                  const SizedBox(height: NPadding.full),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () async {
                        await controller.create().then((status) {
                          if (status) {
                            Get.toNamed(RouteClass.mail);
                          }
                        });
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: NColors.primary,
                      ),
                      child: Text("Create".toUpperCase()),
                    ),
                  ),
                  const SizedBox(height: NPadding.full),
                  Divider(
                    color: Colors.grey.shade500,
                  ),
                  TextButton(
                    onPressed: () async {
                      await controller.random().then((status) {
                        if (status) {
                          Get.toNamed(RouteClass.mail);
                        }
                      });
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(horizontal: NPadding.full),
                      backgroundColor: NColors.highLight,
                    ),
                    child: Text("Random".toUpperCase()),
                  ),
                  const SizedBox(height: NPadding.full),
                  InkWell(
                    onTap: (() async {
                      final mailController = Get.put(MailController());
                      if (mailController.accounts.isNotEmpty) {
                        mailController
                            .selectAccount(mailController.accounts.first);
                        Get.toNamed(RouteClass.mail);
                      } else {
                        await controller.random().then((status) {
                          if (status) {
                            Get.toNamed(RouteClass.mail);
                          }
                        });
                      }
                    }),
                    child: const Text(
                      'Register Mail Accounts',
                      style: TextStyle(
                          color: NColors.primary,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
