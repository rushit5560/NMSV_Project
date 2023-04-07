import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/screens/aplsh_screen/splash_screen.dart';
import 'package:nmsv_project/screens/home_screen/home_screen.dart';
import 'package:nmsv_project/screens/index_screen/index_screen.dart';
import 'package:sizer/sizer.dart';

import 'screens/auth_screens/login_screen/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScareen(),
        );
      },
    );
  }
}
