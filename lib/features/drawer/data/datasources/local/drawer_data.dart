import 'package:audio_app/core/appKey.dart';
import 'package:audio_app/core/audio_db.dart';
import 'package:audio_app/core/functions.dart';
import 'package:audio_app/features/drawer/data/models/drawer_model.dart';
import 'package:audio_app/features/home/presentation/state_managment/get/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import'package:audio_app/core/services.dart';


Services myserv=Get.find();
AudioDB myDb=AudioDB();
HomePageController controller= Get.find();
List<DrawerModel> DrawerData=[
  DrawerModel(title: 'Clear Data', fun: ()async{
    await myDb.deleteAllDataintable('audio');
    controller.getALlAudio();
    Builder(builder: (context) => Functions.showSuccesMessage(context, 'All Audio has been deleted', null)

);
  }, icon: Icon(Icons.image,color: Colors.white,),),

    DrawerModel(title: 'Delete Acount', fun: ()async{
      await myserv.sharedprefresncess.clear();
      await myDb.deleteAllDataintable('audio');
      Builder(builder: (context) => Functions.showSuccesMessage(context, 'Acount has been deleted', null));
      Get.offAllNamed(Appkey.login);
    }, icon: Icon(Icons.delete,color:Colors.white,)),


];