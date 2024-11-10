import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_app/core/errors/failures.dart';
import 'package:audio_app/core/strings.dart';

import 'services.dart';

class Functions {

 
 static double getScreenWidth( BuildContext context){
   return MediaQuery.of(context).size.width;
 }

  static double getScreenHeight( BuildContext context){
   return MediaQuery.of(context).size.height;
 }
  
static showSuccesMessage(BuildContext context,String message,Function()? func){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(    
    action:func==null? null: SnackBarAction(label: 'undo', onPressed: (){
      func.call();
    }),
    backgroundColor: Colors.green,
    content: Text(message,style: TextStyle(color: Colors.white),)));
  }
static showSErrorMessage(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(message,style: TextStyle(color: Colors.white),)));
  }

static initialService() async=> Get.putAsync(await Services().init);

static String mapFailure(Failures faluire) {
  switch(faluire.runtimeType){

    case ServerFaluire():
     return Strings.SERVER_FAILURE_MESSAGE;
    case OfflineFaluire():
     return Strings.OFFLINE_FAILURE_MESSAGE; 
    case EmptyCacheFaluire():
     return Strings.EMPTY_CACHE_FAILURE_MESSAGE;
    default:
     return 'Unexcpected Error , please try again later.* ';
  }
}


}