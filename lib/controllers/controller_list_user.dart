import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tes_transisi/const/base_url.dart';
import 'package:tes_transisi/models/model_list_user.dart';
import 'package:tes_transisi/services/dio_services.dart';

class ControllerListUser extends GetxController {
  bool isload = true;
  String? errorMessage;
  int page = 1;
  ModelListUser? modelListUser;
  getListUser() async {
    isload = true;
    errorMessage = null;
    update();
    try {
      var response = await DioServices.dioServices
          .get(BaseUrl.baseUrl + "/api/users?page=$page");
      if (response.statusCode == 200) {
        log(response.data);
        modelListUser = modelListUserFromJson(response.data);
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
      log(e.message);
      update();
    }
  }
}
