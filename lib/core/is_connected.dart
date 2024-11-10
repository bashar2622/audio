import 'package:connection_checker/connection_checker.dart';

abstract class Isconnection {
  Future <bool> isConnection();
}

class IsConnectionImplementaion extends Isconnection{
final ConnectionChecker internetConnection;

IsConnectionImplementaion({required this.internetConnection});
  @override
  Future<bool> isConnection()async {
    if(await internetConnection.hasConnection){
      return Future.value(true);
    }
    else{return Future.value(false);}
  }

}