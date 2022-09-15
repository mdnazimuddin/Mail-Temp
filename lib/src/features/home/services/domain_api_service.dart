import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mailtemp/src/utils/constants.dart';

import '../models/Domain.dart';

class DomainAPIService {
  static Future getAllDomain() async {
    late final Dio http = Dio(BaseOptions(
      baseUrl: BASE_URL,
      contentType: 'application/json',
      validateStatus: (int? status) => (status ?? 400) < 500,
    ));

    try {
      Response response = await http.get(
        '/domains',
      );
      if (response.statusCode == 200) {
        return domainFromJson(response.data["hydra:member"]);
      }
    } on DioError catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }
}
