import 'dart:io';
import 'package:audio_app/core/audio_db.dart';
import 'package:audio_app/core/themes.dart';
import'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio_app/core/services.dart';
import'package:file_picker/file_picker.dart';

class HomePageController extends GetxController{

  
  final player = AudioPlayer();

  File? fileUrl ;

  Services serv=Get.find<Services>();

  GlobalKey<ScaffoldState> key=GlobalKey<ScaffoldState>();

  AudioDB db=AudioDB();

  List MyAudio=[];

  bool isplaying=false;

  int currentAudio=20000;

  Duration duration=Duration.zero;

  Duration position=Duration.zero;
 
  
  @override
  void onInit() {
  
      getALlAudio();
      player.onPlayerStateChanged.listen((state){
        print(state);
      });
      player.onDurationChanged.listen((newDuration){
        duration=newDuration;
        update();
      });
      player.onPositionChanged.listen((newposition){
        position=newposition;
        update();
      });
      super.onInit();
  }


getALlAudio()async{
  currentAudio=1000;
  isplaying=false;
List response=[];
   response = await db.readData("SELECT * FROM 'audio'"); 
    print(response.length);
    MyAudio=response;
    getAudio();
    update();  
  }

List getAudio(){
    print(MyAudio);
    return MyAudio.toList();
  }
paick_file() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
if (result != null) {
     fileUrl = File(result.files.single.path!);
     await db.insertData("INSERT INTO 'audio' ('name','date') VALUES ('${fileUrl.toString().split('/').last.split('\'').first}','${DateTime.now()}') ");
    print(fileUrl);
getALlAudio();
} else {
}
  }

play_or_pause(String name,int id)async{
        player.setReleaseMode(ReleaseMode.stop);
        player.release();
    if(isplaying==true){
      await player.stop();
      isplaying=false;
      currentAudio=5000;

    }
   else{                     
    await player.play(UrlSource('/data/user/0/com.example.audio_app/cache/file_picker/'+'${name}'));
    currentAudio=id;
    isplaying=true;
   }
   update();

  }
  
String FormatTime(Duration duration){
    String twodigits(int n)=>n.toString().padLeft(2,'0');
    final hour=twodigits(duration.inHours);
    final minute=twodigits(duration.inMinutes.remainder(60));
    final seconde=twodigits(duration.inSeconds.remainder(60));
    return [if(duration.inHours>0)hour,minute,seconde ].join(':');

  }
  delteAudio(int id,BuildContext context)async{
    showDialog(context: context, builder:(context) =>  AlertDialog(
    title: Text('do you want yo delete this music?',style: themes.textTheme.titleSmall ,),
    shape: LinearBorder(),
  content: Row(children: [
      IconButton(onPressed: ()async{
        await db.deleteData("DELETE FROM 'audio' WHERE id=${id}");
        Get.back();
    }, icon: Icon(Icons.done))
    ,  IconButton(onPressed: (){
      Get.back();
    }, icon: Icon(Icons.cancel_outlined))
  ],mainAxisAlignment: MainAxisAlignment.spaceBetween ,), 
   ));
getALlAudio();
update();
  }

}