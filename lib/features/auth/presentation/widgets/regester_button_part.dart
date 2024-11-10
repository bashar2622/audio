import 'package:audio_app/core/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_app/features/auth/presentation/state_managment/get/login_controller.dart';

class ResgesterButtonPart extends GetView<LoginController> {
  const ResgesterButtonPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder:(controller) =>Directionality(
                        textDirection: TextDirection.rtl,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            child:  Text('continue',style: TextStyle(color: Colors.white),),
                            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(themes.scaffoldBackgroundColor)),
                            onPressed: (){
                            controller.goToHomePage(context);
                            },
                          )
                        ),
                      ),
    );
  }
}