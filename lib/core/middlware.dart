
import 'package:flutter/material.dart';
import 'appKey.dart';
import 'services.dart';
import 'package:get/get.dart';

class MyMiddlware extends GetMiddleware{


  @override
  int? priority;

  Services services=Get.find<Services>();


  @override
  RouteSettings? redirect(String? route) {

  if(services.sharedprefresncess.getString('name')!=null){  
     return RouteSettings(name: Appkey.Home);
   }
   return null;
  }

 

}