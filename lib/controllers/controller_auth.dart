import 'dart:developer';

import 'package:get/get.dart';
import 'package:dio/dio.dart';

import 'package:tes_transisi/screens/screen_list_user.dart';
import 'package:tes_transisi/services/dio_services.dart';

class ControllerAuth extends GetxController {
  bool isload = false;
  String? errorMessage;

  register(String email, String password) async {
    log("message");
    isload = true;
    errorMessage = null;

    update();
    try {
      var response = await DioServices.dioServices
          .post("https://reqres.in/api/register", data: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        log(response.data);

        isload = false;
        update();
        Get.toNamed(ScreenListUser.namePage);
      } else {
        errorMessage = response.statusMessage;
        log(response.statusMessage!);
        isload = false;
        update();
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        Get.rawSnackbar(message: e.response!.data!);
      } else {
        Get.rawSnackbar(
          message: e.message,
        );
      }
      log(e.response!.data!);
      errorMessage = e.message;
      isload = false;
      update();
    }
  }

  login(String email, String password) async {
    isload = true;
    errorMessage = null;
    update();
    try {
      var response = await DioServices.dioServices
          .post("https://reqres.in/api/login", data: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        log(response.data);
        Get.toNamed(ScreenListUser.namePage);
        isload = false;
        update();
      } else {
        errorMessage = response.statusMessage;
        log(response.statusMessage!);
        isload = false;
        update();
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        Get.rawSnackbar(message: e.response!.data!);
      } else {
        Get.rawSnackbar(
          message: e.message,
        );
      }
      errorMessage = e.message;
      isload = false;
      update();
    }
  }
}
