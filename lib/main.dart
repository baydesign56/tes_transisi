import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tes_transisi/screens/screen_auth.dart';
import 'package:tes_transisi/screens/screen_create_user.dart';
import 'package:tes_transisi/screens/screen_detail_user.dart';
import 'package:tes_transisi/screens/screen_list_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final Map<int, Color> _blue = {
      50: const Color(0xFFFFD7C2),
      100: Colors.blue[100]!,
      200: Colors.blue[200]!,
      300: Colors.blue[300]!,
      400: Colors.blue[400]!,
      500: Colors.blue[500]!,
      600: Colors.blue[600]!,
      700: Colors.blue[700]!,
      800: Colors.blue[800]!,
      900: Colors.blue[900]!,
    };

    return GetMaterialApp(
      title: 'tes_transisi',
      theme: ThemeData(
        primarySwatch: MaterialColor(Colors.blue[900]!.value, _blue),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue[900],
        ),
      ),
      home: const ScreenAuth(),
      // initialRoute: ScreenListUser.namePage,
      getPages: [
        GetPage(
          name: ScreenListUser.namePage,
          page: () => const ScreenListUser(),
        ),
        GetPage(
          name: ScreenDetailUser.namePage,
          page: () => const ScreenDetailUser(),
        ),
        GetPage(
          name: ScreenCreateUser.namePage,
          page: () => const ScreenCreateUser(),
        )
      ],
    );
  }
}
