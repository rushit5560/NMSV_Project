import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nmsv_project/screens/splash_screen/splash_screen.dart';
import 'package:sizer/sizer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: 'alerts',
          channelName: 'alerts',
          channelDescription: 'Notification tests as alerts',
          playSound: true,
          //defaultPrivacy: NotificationPrivacy.Private,
          //importance: NotificationImportance.High,
          //onlyAlertOnce: true,
          defaultColor: Colors.deepPurple,
          ledColor: Colors.deepPurple
      ),
    ],
    debug: true
  );
  runApp(const MyApp());

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
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
