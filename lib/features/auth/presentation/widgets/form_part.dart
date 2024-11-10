import 'package:audio_app/features/auth/presentation/state_managment/get/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_app/core/functions.dart';
import 'package:audio_app/core/themes.dart';

class FormPart extends GetView<LoginController> {
  const FormPart({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<LoginController>(
    builder: (controller) => Container(
                            padding: EdgeInsets.all(5),
                            width: Functions.getScreenWidth(context),
                            height: Functions.getScreenHeight(context)/14,
                            child: Center(
                              child:  Form (
                                key:controller.key,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: controller.controller,
                                  validator: (value){
                                    if(value!.isEmpty){
                                          return "can't be null";
                                    }return null;
                                  },
                                      decoration: InputDecoration(
                                        
                                        icon:Icon(Icons.person,color: themes.iconTheme.color,),
                                        hintText: 'enter your name',
                                        
                                        hintStyle: themes.textTheme.titleSmall,
                                        
                                         labelStyle: TextStyle(color: Colors.black),
border: OutlineInputBorder(borderSide: BorderSide.none)
                                      ),
                                    ),
                              ),
                          ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Colors.white)
                  ),
    );
  }
}