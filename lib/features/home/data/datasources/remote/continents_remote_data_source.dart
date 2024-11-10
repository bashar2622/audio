// import 'dart:convert';
// import '../../../../../core/errors/exceptions.dart';
// import '../../models/continents_model.dart';
// import '../../../../../core/strings.dart';
// import 'package:http/http.dart' as http;
// abstract class ContinentsRemoteDataSource {

//  Future <List<ContinentsModel>> getContinents();
 
// }

// class ContinentsRemoteDataSourceImplementation extends ContinentsRemoteDataSource{

//   final http.Client client;

//   ContinentsRemoteDataSourceImplementation({required  this.client});

//   @override
//   Future  <List<ContinentsModel>> getContinents()async {
  
//   final response= await client.get(Uri.parse(Strings.continents_url),headers: {'accept':' application/json'});

//   if(response.statusCode==200||response.statusCode==201) {
  
//   final List data=jsonDecode(response.body);

//   final List<ContinentsModel> data_json=data.map((e) => ContinentsModel.fromJson(e)).toList();

//   return data_json;

//   }
//   else{

//     throw ServerExcexption();
//   }


//   }
// }