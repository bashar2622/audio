import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services extends GetxService{

  late SharedPreferences sharedprefresncess ;

  Future <Services> init() async{
    
   sharedprefresncess= await SharedPreferences.getInstance();
   
   return this;

  }


}