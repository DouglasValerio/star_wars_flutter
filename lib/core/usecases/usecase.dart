import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}

class StrParams {
  final String string;

  StrParams({@required this.string});
}

class NoParams {}
