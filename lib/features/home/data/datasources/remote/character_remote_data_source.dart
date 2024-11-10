// import 'dart:convert';

// import '../../../../../core/errors/exceptions.dart';
// import '../../../../../core/strings.dart';
// import '../../models/charcters_model.dart';
// import 'package:http/http.dart' as http;
// abstract class CharacterRemoteDataSource {

//  Future <List<CharactersModel>> getCharacter();}

// class CharacterRemoteDataSourceImplementaion extends CharacterRemoteDataSource{

//   final http.Client client;

//   CharacterRemoteDataSourceImplementaion({required  this.client});

//   @override
//   Future <List<CharactersModel>> getCharacter() async {
  
//   final response= await client.get(Uri.parse(Strings.charcter_url),headers: {'accept':' application/json'});



//   if(response.statusCode==200||response.statusCode==201) {
  
//   final List data=jsonDecode(response.body)  ;

//   final List<CharactersModel> json_data=data.map((e) => CharactersModel.fromJson(e)).toList();

//   print('1');

//   return  json_data;

//   }
//   else{

//     throw ServerExcexption();
//   }


//   }
// }