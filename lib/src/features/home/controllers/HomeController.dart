// ignore_for_file: file_names, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mailtemp/src/features/home/models/Domain.dart';
import 'package:mailtemp/src/features/home/services/account_api_service.dart';
import 'package:mailtemp/src/features/home/services/domain_api_service.dart';
import 'package:mailtemp/src/features/mail/controllers/MailController.dart';
import 'package:mailtemp/src/utils/constants.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends GetxController {
  late Box box;
  final account = Get.put(MailController());
  late String selectedDomain = "Select Domain";
  final List<String> domainNames = [];
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  bool obscureText = true;
  @override
  onInit() async {
    super.onInit();
    await getDomains();
  }

  getDomains() async {
    EasyLoading.show(status: 'loading...');

    await DomainAPIService.getAllDomain().then((data) {
      for (Domain domain in data) {
        domainNames.add("Select Domain");
        domainNames.add(domain.domain);
      }
    });
    EasyLoading.dismiss();
    update();
  }

  selectDomain(value) {
    selectedDomain = value;
    update();
  }

  changeObscure() {
    obscureText = !obscureText;
    update();
  }

  create() async {
    EasyLoading.show();
    if (username.text.isEmpty) {
      username.text = randomString(10);
    }
    if (password.text.isEmpty) {
      password.text = randomString(10);
    }
    if (selectedDomain == "Select Domain") {
      selectedDomain = "emergentvillage.org";
    }

    String address = '${username.text}@$selectedDomain';
    await AccountAPIService.create(
            data: {'address': address, 'password': password.text})
        .then((data) async {
      if (data != null) {
        await openBox();
        box.add(data.toJson());
        account.setAccount(data);
      } else {
        print('Error');
      }
    });

    EasyLoading.dismiss();
    update();
    return true;
  }

  random() async {
    EasyLoading.show();
    username.text = randomString(10);
    password.text = randomString(10);
    selectedDomain = "emergentvillage.org";

    String address = '${username.text}@$selectedDomain';
    await AccountAPIService.create(
            data: {'address': address, 'password': password.text})
        .then((data) async {
      if (data != null) {
        await openBox();
        box.add(data.toJson());
        account.setAccount(data);
        return true;
      } else {
        print('Error');
      }
    });
    EasyLoading.dismiss();
    return true;
  }

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('accounts');
    return;
  }
}
