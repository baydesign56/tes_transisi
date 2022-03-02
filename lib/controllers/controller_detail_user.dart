import 'dart:developer';

import 'package:get/get.dart';
import 'package:tes_transisi/const/base_url.dart';
import 'package:tes_transisi/services/dio_services.dart';
import 'package:dio/dio.dart';

class ControllerDetailUser extends GetxController {
  bool isload = false;
  String? errorMessage;

  getUser(int idUser) async {
    isload = true;
    errorMessage = null;
    update();
    try {
      var response = await DioServices.dioServices
          .get(BaseUrl.baseUrl.toString() + "/api/users/$idUser");
      if (response.statusCode == 200) {
        log(response.data);
        isload = false;
        update();
      } else {
        errorMessage = response.statusMessage;
        log(response.statusMessage!);
        isload = false;
        update();
      }
    } on DioError catch (e) {
      errorMessage = e.message;
      isload = false;
      update();
    }
  }
}
