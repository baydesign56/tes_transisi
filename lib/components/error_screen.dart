import 'package:flutter/material.dart';

Widget errorScreen(String errorMessage, Widget button) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
            ),
          ),
          button,
        ],
      ),
    ),
  );
}
