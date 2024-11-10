import 'package:audio_app/core/themes.dart';
import 'package:audio_app/core/widgets/custom_height.dart';
import 'package:audio_app/features/home/presentation/state_managment/get/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioContent extends GetView<HomePageController> {
  const AudioContent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
                            builder:(controller) => RefreshIndicator(
                                onRefresh: ()async{
                                 await  controller.getALlAudio();
                                 print('2');
                                },
                                child: ListView.separated(itemBuilder: (context, index) => CustomHeight(),
                                 separatorBuilder: (context, index) => Column(
                                   children: [
                                     ListTile(
                                      title: Text('${controller.getAudio()[index]['name']}',style: themes.textTheme.titleMedium,overflow: TextOverflow.ellipsis,),
                                      subtitle: Text('${controller.getAudio()[index]['date']}',style: themes.textTheme.titleSmall,),
                                      trailing: IconButton(onPressed: () {
                                      controller.delteAudio(controller.getAudio()[index]['id'],context);                             
                                      },icon: Icon(Icons.delete)),
                                      leading: IconButton(onPressed: (){
                                        controller.play_or_pause(controller.MyAudio[index]['name'],controller.MyAudio[index]['id']);                                
                                      },
                                      icon:controller.currentAudio==controller.MyAudio[index]['id']? Icon(Icons.pause,color: Colors.white, ):
                                      Icon(Icons.play_arrow,color: Colors.white,)),
                                     ),
                              Slider(
                                min:0,                                
                                max:controller.duration.inSeconds.toDouble(),
                                value:controller.currentAudio==controller.MyAudio[index]['id']?
                                 controller.position.inSeconds.toDouble():0,
                                 onChanged: (value)async{
                                controller.position=Duration(seconds: value.toInt());
                               await controller.player.seek(controller.position);
                                 }),
                                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                  Text(
                                    controller.currentAudio==controller.MyAudio[index]['id']?
                                  controller.FormatTime(controller.position):'',style: themes.textTheme.titleSmall,),
                                    
                                  Text(controller.currentAudio==controller.MyAudio[index]['id']? 
                                controller.FormatTime( controller.duration):'',style: themes.textTheme.titleSmall),
                                 ],)
                                   ],
                                 ), itemCount: controller.MyAudio.length),
                              ));
                            
                        
                    
  }
}