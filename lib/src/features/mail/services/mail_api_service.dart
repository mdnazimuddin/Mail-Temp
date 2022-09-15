// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mailtemp/src/features/home/models/Account.dart';
import 'package:mailtemp/src/features/mail/models/Message.dart';
import 'package:mailtemp/src/utils/constants.dart';

class MailAPIService {
  static Future getAllMail({required token}) async {
    late final Dio http = Dio(BaseOptions(
      baseUrl: BASE_URL,
      contentType: 'application/json',
      headers: {'Authorization': 'Bearer $token'},
      validateStatus: (int? status) => (status ?? 400) < 500,
    ));

    try {
      Response response = await http.get(
        '/messages',
      );
      if (response.statusCode == 200) {
        return messageFromJsonList(response.data["hydra:member"]);
      }
    } on DioError catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }

  static Future create({required data}) async {
    late final Dio http = Dio(BaseOptions(
      baseUrl: BASE_URL,
      contentType: 'application/json',
      validateStatus: (int? status) => (status ?? 400) < 500,
    ));
    try {
      Response response = await http.post('/accounts', data: data);

      if (response.statusCode == 201) {
        var token = await getToken(response.data['address'], data['password']);
        return Account.fromJson(response.data, data['password'], token);
      } else {
        print(response.data);
      }
    } on DioError catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }

  static Future getToken(String address, String password) async {
    late final Dio http = Dio(BaseOptions(
      baseUrl: BASE_URL,
      contentType: 'application/json',
      validateStatus: (int? status) => (status ?? 400) < 500,
    ));
    try {
      Response response = await http.post('/token', data: {
        'address': address,
        'password': password,
      });
      if (response.statusCode == 200) {
        return response.data['token'];
      } else {
        print(response.data);
      }
    } on DioError catch (e) {
      debugPrint(e.toString());
    }

    return '';
  }
}
