import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/app/modules/splash/bindings/splash_binding.dart';
import 'package:project/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/modules/login/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() async => await SharedPreferences.getInstance());

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute:
          _authController.isLoggedIn.value ? '/home' : '/login_detail',
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
    );
  }
}
