import 'package:audio_app/core/appKey.dart';
import 'package:audio_app/core/functions.dart';
import 'package:audio_app/core/middlware.dart';
import 'package:audio_app/core/themes.dart';
import 'package:audio_app/features/auth/presentation/pages/login.dart';
import 'package:audio_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Functions.initialService();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themes,
      getPages: [
        GetPage(name: Appkey.login, page:() => Login(),middlewares: [MyMiddlware()]),
        GetPage(name: Appkey.Home, page:() => Home()),

      ],
        );
  }
}

