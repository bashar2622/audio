import 'package:audio_app/core/themes.dart';
import 'package:audio_app/features/drawer/presentation/widgets/drawer.dart';
import 'package:audio_app/features/home/presentation/widgets/audio_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_app/features/home/presentation/state_managment/get/home_page_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return GetBuilder<HomePageController>(
      builder:(controller) =>Scaffold(
        key: controller.key,
        drawer: CustomDrawer(),
        appBar: AppBar(
          backgroundColor: themes.scaffoldBackgroundColor,
          centerTitle: true,
          leading: IconButton(onPressed: (){
            controller.key.currentState!.openDrawer();
          }, icon: Icon(Icons.menu,color: Colors.white,)),
          title: Text('Hi ${controller.serv.sharedprefresncess.getString('name')}',style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,),),
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: (){controller.paick_file();
        }),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text('Recent Audio',style: themes.textTheme.titleLarge),           
                    Expanded(child: AudioContent())
                            ],),
            ),
          ),
      ),
    );
  }
}

