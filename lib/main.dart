import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/screen_routes/app_screens.dart';
import 'package:greengrocer/src/screens/auth/controller/auth_controller.dart';

void main() {
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Greengrocer',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: ScreensRoutes.splashRoute,
      getPages: AppScreens.screens,
    );
  }
}
