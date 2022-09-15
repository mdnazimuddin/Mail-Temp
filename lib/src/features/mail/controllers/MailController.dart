// ignore_for_file: file_names

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:mailtemp/src/features/mail/models/Message.dart';
import 'package:mailtemp/src/features/mail/services/mail_api_service.dart';
import 'package:mailtemp/src/route/routes.dart';
import 'package:path_provider/path_provider.dart';

import '../../home/models/Account.dart';

class MailController extends GetxController {
  late Box box;
  late Account account;
  late List<Account> accounts = [];
  late List<Message> messages = [];
  late Message message;
  @override
  void onInit() async {
    super.onInit();
    await openBox();
    getAllAccount();
  }

  getAllAccount() {
    var data = box.toMap().values.toList();
    accounts = [];
    for (var element in data) {
      accounts.add(Account(
          id: element['id'],
          address: element['address'],
          createdAt: DateTime.parse(element['createdAt']),
          isDeleted: element['isDeleted'],
          isDisabled: element['isDisabled'],
          password: element['password'],
          quota: element['quota:'] ?? 0,
          token: element['token'],
          updatedAt: DateTime.parse(element['updatedAt']),
          used: element['used'] ?? 0));
    }
    update();
  }

  setAccount(Account value) {
    account = value;
    getAllAccount();
    getAllMessage();
    update();
  }

  selectAccount(Account value) {
    account = value;
    getAllMessage();
    update();
  }

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('accounts');
    return;
  }

  getAllMessage() async {
    EasyLoading.show();
    await MailAPIService.getAllMail(token: account.token).then((data) {
      messages = data;
    });
    EasyLoading.dismiss();
    update();
  }

  delete() {
    int index = accounts.indexOf(account);
    box.deleteAt(index);
    getAllAccount();
    if (accounts.isEmpty) {
      Get.back();
    } else {
      selectAccount(accounts.last);
    }
    update();
  }

  setMessage(value) {
    message = value;
    update();
    Get.toNamed(RouteClass.mailDelails);
  }
}
