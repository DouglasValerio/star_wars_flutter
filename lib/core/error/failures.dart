import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class ApiFailure extends Failure {
  @override
  List<Object> get props => [];
}


