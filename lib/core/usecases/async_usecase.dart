import 'package:dartz/dartz.dart';
import '../error/failures.dart';

abstract class AsyncUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class AsyncListUseCase<Type, Params> {
  Future<Either<Failure, List<Type>>> call(Params params);
}
