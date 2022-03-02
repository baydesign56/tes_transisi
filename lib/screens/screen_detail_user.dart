import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:tes_transisi/models/model_list_user.dart';

class ScreenDetailUser extends StatefulWidget {
  const ScreenDetailUser({Key? key}) : super(key: key);
  static String namePage = "/detail-user";

  @override
  _ScreenDetailUserState createState() => _ScreenDetailUserState();
}

class _ScreenDetailUserState extends State<ScreenDetailUser> {
  @override
  Widget build(BuildContext context) {
    Datum data = Get.arguments['data'];
    log(data.firstName!);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star_border),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: Get.width,
              decoration: BoxDecoration(
                color: Colors.blue[900],
              ),
              child: Stack(children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.network(
                    data.avatar!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: Text(
                        data.firstName.toString() +
                            " " +
                            data.lastName.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24,
                        )),
                  ),
                )
              ]),
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.blue[900]!,
              ),
              title: Text(data.email ?? "email@gamil.com"),
            )
          ],
        ),
      ),
    );
  }
}
