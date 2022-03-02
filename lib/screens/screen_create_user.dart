import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tes_transisi/controllers/controller_create_user.dart';
import 'package:tes_transisi/controllers/controller_image_picker.dart';

class ScreenCreateUser extends StatefulWidget {
  const ScreenCreateUser({Key? key}) : super(key: key);
  static String namePage = "/screen-create-user";

  @override
  _ScreenCreateUserState createState() => _ScreenCreateUserState();
}

class _ScreenCreateUserState extends State<ScreenCreateUser> {
  TextEditingController name = TextEditingController();
  FocusNode fname = FocusNode();
  TextEditingController job = TextEditingController();
  FocusNode fjob = FocusNode();
  File? image;

  ControllerCreateUser controllerCreateUser = Get.put(ControllerCreateUser());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerCreateUser>(builder: (value) {
      return GestureDetector(
        onTap: () {
          setState(() {
            fname.unfocus();
            fjob.unfocus();
          });
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Create user"),
            actions: [
              name.text.isEmpty || job.text.isEmpty || image == null
                  ? const SizedBox(
                      width: 0,
                      height: 0,
                    )
                  : TextButton(
                      onPressed: () {
                        controllerCreateUser.createUser(name.text, job.text);
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
            ],
          ),
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Stack(
              children: [
                Positioned(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: Get.width,
                      child: Column(children: [
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            ControllerImagePicker.imagePick(
                                    source: ImageSource.gallery)
                                .then((value) {
                              setState(() {
                                value == null ? log("null") : image = value;
                              });
                            });
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(300),
                            child: Container(
                              width: Get.width / 3,
                              height: Get.width / 3,
                              decoration: BoxDecoration(
                                color: Colors.blue[900],
                                shape: BoxShape.circle,
                              ),
                              child: image == null
                                  ? const Center(
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Image.file(
                                      image!,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            focusNode: fname,
                            controller: name,
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_circle_outlined,
                              ),
                              label: Text("Name"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextField(
                            focusNode: fjob,
                            controller: job,
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.badge_outlined,
                              ),
                              label: Text("Job"),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
                if (value.isload)
                  const Positioned(
                    child: Center(child: CircularProgressIndicator()),
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
