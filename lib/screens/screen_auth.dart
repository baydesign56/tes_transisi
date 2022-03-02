import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_transisi/controllers/controller_auth.dart';
import 'package:tes_transisi/controllers/controller_create_user.dart';
import 'package:tes_transisi/controllers/controller_list_user.dart';

class ScreenAuth extends StatefulWidget {
  const ScreenAuth({Key? key}) : super(key: key);
  static String namePage = "/auth";

  @override
  _ScreenAuthState createState() => _ScreenAuthState();
}

class _ScreenAuthState extends State<ScreenAuth> {
  TextEditingController email = TextEditingController();
  FocusNode femail = FocusNode();
  TextEditingController password = TextEditingController();
  FocusNode fpassword = FocusNode();
  ControllerAuth controllerAuth = Get.put(ControllerAuth());
  ControllerListUser controllerListUser = Get.put(ControllerListUser());
  ControllerCreateUser controllerCreateUser = Get.put(ControllerCreateUser());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerAuth>(builder: (value) {
      return SizedBox(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            Positioned(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    femail.unfocus();
                    fpassword.unfocus();
                  });
                },
                child: Scaffold(
                    appBar: AppBar(title: const Text("Auth")),
                    body: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextField(
                              focusNode: femail,
                              controller: email,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: const InputDecoration(
                                label: Text("Email"),
                              ),
                            ),
                            TextField(
                              controller: password,
                              focusNode: fpassword,
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: const InputDecoration(
                                label: Text("Password"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    bottomNavigationBar:
                        email.text.isNotEmpty || password.text.isNotEmpty
                            ? SizedBox(
                                height: 70,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: GestureDetector(
                                        onTap: () {
                                          controllerAuth.register(
                                              email.text, password.text);
                                        },
                                        child: Container(
                                          height: 80,
                                          width: Get.width,
                                          margin: const EdgeInsets.fromLTRB(
                                              15, 15, 7.5, 15),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.blue[900]!,
                                            ),
                                          ),
                                          child: Center(
                                              child: Text(
                                            "Resgiter",
                                            style: TextStyle(
                                              color: Colors.blue[900]!,
                                            ),
                                          )),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: GestureDetector(
                                        onTap: () {
                                          controllerAuth.login(
                                              email.text, password.text);
                                        },
                                        child: Container(
                                          height: 80,
                                          width: Get.width,
                                          margin: const EdgeInsets.fromLTRB(
                                              7.5, 15, 15, 15),
                                          color: Colors.blue[900],
                                          child: const Center(
                                              child: Text(
                                            "Login",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          )),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : null),
              ),
            ),
            if (value.isload)
              const Positioned(
                  child: Center(
                child: CircularProgressIndicator(),
              ))
          ],
        ),
      );
    });
  }
}
