import 'package:get_it/get_it.dart';

final  sl=GetIt.instance;

Future <void> init()async{
  await  sl.resetLazySingleton();
}