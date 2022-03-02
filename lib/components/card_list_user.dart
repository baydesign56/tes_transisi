import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tes_transisi/models/model_list_user.dart';
import 'package:tes_transisi/screens/screen_detail_user.dart';

Widget cardListComponents(Datum dataUser) {
  return InkWell(
    onTap: () {
      Get.toNamed(
        ScreenDetailUser.namePage,
        arguments: {"data": dataUser},
      );
    },
    child: Container(
      padding: const EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    dataUser.avatar!,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Text(
                          dataUser.firstName![0] + dataUser.lastName![0]);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dataUser.firstName.toString() +
                        " " +
                        dataUser.lastName.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    dataUser.email.toString(),
                    style: const TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star_border,
              color: Colors.black54,
            ),
          )
        ],
      ),
    ),
  );
}
