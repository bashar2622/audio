import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_app/core/functions.dart';
import 'package:audio_app/core/widgets/animation_handle.dart';
import 'package:audio_app/core/widgets/custom_height.dart';
import 'package:audio_app/features/auth/presentation/state_managment/get/login_controller.dart';
import 'package:audio_app/features/auth/presentation/widgets/form_part.dart';
import 'package:audio_app/features/auth/presentation/widgets/hello_part.dart';
import 'package:audio_app/features/auth/presentation/widgets/info_part.dart';
import 'package:audio_app/features/auth/presentation/widgets/regester_button_part.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LoginController>(
          builder:(controller) =>  Container(
                 padding: EdgeInsets.all(10),
                  width: Functions.getScreenWidth(context),
                  height: Functions.getScreenHeight(context),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center ,
                children: [
                CustomHeight(),
                animationHandle(child: HelloPart()),
                CustomHeight(),
                animationHandle(child: InfoPart()),
                CustomHeight(), 
                animationHandle(child: FormPart()),
                CustomHeight(),
                animationHandle(child: ResgesterButtonPart()),
                
                
                ],
              ),
          ),
          ),
        ),
      ),
    );
  }
}

