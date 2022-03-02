import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_transisi/components/card_list_user.dart';
import 'package:tes_transisi/components/error_screen.dart';
import 'package:tes_transisi/components/load_screen.dart';
import 'package:tes_transisi/controllers/controller_list_user.dart';
import 'package:tes_transisi/screens/screen_create_user.dart';

class ScreenListUser extends StatefulWidget {
  const ScreenListUser({Key? key}) : super(key: key);
  static String namePage = "/list-user";

  @override
  _ScreenListUserState createState() => _ScreenListUserState();
}

class _ScreenListUserState extends State<ScreenListUser> {
  ControllerListUser controllerListUser = Get.put(ControllerListUser());
  @override
  void initState() {
    super.initState();
    controllerListUser.getListUser();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerListUser>(builder: (value) {
      return value.isload
          ? loadScreen()
          : value.errorMessage == null
              ? Scaffold(
                  appBar: AppBar(
                    title: const Text("List User"),
                    automaticallyImplyLeading: false,
                  ),
                  body: SafeArea(
                    child: SingleChildScrollView(
                        child: value.modelListUser == null ||
                                value.modelListUser!.data!.isEmpty
                            ? const Center(
                                child: Text("Tidak ada user"),
                              )
                            : Column(
                                children: [
                                  const SizedBox(
                                    height: 7.5,
                                  ),
                                  for (var item in value.modelListUser!.data!)
                                    cardListComponents(item)
                                  // CardListUser(item)
                                ],
                              )),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      Get.toNamed(ScreenCreateUser.namePage);
                    },
                    child: const Icon(Icons.add),
                  ),
                )
              : errorScreen(
                  value.errorMessage ?? "Error",
                  TextButton(
                    onPressed: () {
                      controllerListUser.getListUser();
                    },
                    child: const Text(
                      "Muat ulang",
                    ),
                  ));
    });
  }
}
