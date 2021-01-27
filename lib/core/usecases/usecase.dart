import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

class IntParams {
  final int number;

  IntParams({@required this.number});
}

class NoParams {}
