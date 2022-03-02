import 'dart:developer';

import 'package:get/get.dart';
import 'package:tes_transisi/const/base_url.dart';
import 'package:tes_transisi/services/dio_services.dart';
import 'package:dio/dio.dart';

class ControllerCreateUser extends GetxController {
  bool isload = false;
  String? errorMessage;

  createUser(String name, String job) async {
    log("hmm");
    isload = true;
    errorMessage = null;
    update();
    try {
      var response = await DioServices.dioServices.post(
        BaseUrl.baseUrl.toString() + "/api/users",
        queryParameters: {
          "name": name,
          "job": job,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data);
        isload = false;
        Get.back();
        update();
      } else {
        errorMessage = response.statusMessage;
        log(response.statusMessage!, name: "ini error ${response.statusCode} ");
        isload = false;
        Get.rawSnackbar(message: response.statusMessage);

        update();
      }
    } on DioError catch (e) {
      errorMessage = e.message;
      isload = false;
      log(e.message, name: "ini error");
      Get.rawSnackbar(
        message: e.message,
      );
      update();
    }
  }
}
