import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable{}

class OfflineFaluire extends Failures{

  @override
  List<Object?> get props =>[];
}

class ServerFaluire extends Failures{
  
  @override
  List<Object?> get props =>[];
}

class EmptyCacheFaluire extends Failures{
  
  @override
  List<Object?> get props =>[];
}

