import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_app/core/themes.dart';
import 'package:audio_app/features/drawer/data/datasources/local/drawer_data.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DrawerController);
    return  Drawer(
      backgroundColor:Color(0xff292b37),
      elevation: 1,
      child: Column(children: [
        Container(
          height: Get.height/2.5,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/logo/logo.jpg'),fit: BoxFit.cover)),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: DrawerData.length,
            separatorBuilder: (context, index) => SizedBox(height: 10,),
            itemBuilder:(context, index) => InkWell(
              onTap: (){
                DrawerData[index].fun.call();
              },
              child: ListTile(
              
                leading:DrawerData[index].icon ,
                title:Text( DrawerData[index].title.toString(),style: themes.textTheme.titleMedium,),
              ),
            )
           ),
        )
          ]
         )
          );
  }
}