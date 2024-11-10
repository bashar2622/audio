import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final themes=ThemeData(
  scaffoldBackgroundColor: Color(0xff0f111d),
  iconTheme: IconThemeData(color: Colors.black),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,systemNavigationBarIconBrightness:
    Brightness.dark,statusBarIconBrightness: Brightness.light,
   systemNavigationBarColor: Colors.white,statusBarColor: Color(0xff0f111d),
    ),
    centerTitle: true,backgroundColor:Colors.white,elevation: 0.0,),
    textTheme: TextTheme(
    
    titleLarge: TextStyle(color: Colors.white,fontSize: 20,overflow: TextOverflow.ellipsis,),
    titleMedium: TextStyle(color: Colors.white,fontSize: 16,overflow: TextOverflow.ellipsis,),
    titleSmall: TextStyle(color: Color(0xff777985),fontSize: 12,overflow: TextOverflow.ellipsis,)

  )
);