import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/main_themes.dart';
import '../../domain/repositories/main_themes_repository.dart';
import '../sources/main_themes_remote_data_source.dart';

class MainThemesRepositoryImpl implements MainThemesRepository {
  final MainThemesRemoteDataSource remoteDataSource;

  MainThemesRepositoryImpl({this.remoteDataSource});

  Future<Either<Failure, List<MainThemes>>> getMainThemesList() async {
    try {
      final List<MainThemes> availableOrdersFromDatabase =
          await remoteDataSource.getMainThemesList();

      return Right(availableOrdersFromDatabase);
    } on Exception {
      return Left(ApiFailure());
    }
  }
}
