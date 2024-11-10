import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_app/core/appKey.dart';
import 'package:audio_app/core/functions.dart';
import 'package:audio_app/core/services.dart';


class LoginController extends GetxController{

final GlobalKey<FormState> key=GlobalKey<FormState>();

final TextEditingController controller=TextEditingController();


@override
  void onInit() {
  super.onInit();
  }
  goToHomePage(BuildContext context){
    Services  service = Get.find<Services>();
    if(key.currentState!.validate()){
    service.sharedprefresncess.setString('name', controller.text.toString().trim());
        Get.offAllNamed(Appkey.Home);
    Functions.showSuccesMessage(context, 'Login success',null);
    }
    else{
      Functions.showSErrorMessage(context, 'please enter your name');
    }
  }
}