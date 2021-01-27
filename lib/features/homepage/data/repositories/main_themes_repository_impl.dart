import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/main_themes.dart';
import '../../domain/repositories/main_themes_repository.dart';
import '../models/main_themes_model.dart';
import '../sources/main_themes_local_data_source.dart';
import '../sources/main_themes_remote_data_source.dart';

class MainThemesRepositoryImpl implements MainThemesRepository {
  final MainThemesRemoteDataSource remoteDataSource;
  final MainThemesLocalDataSource localDataSource;

  MainThemesRepositoryImpl({
    this.remoteDataSource,
    this.localDataSource,
  });

  Future<Either<Failure, List<MainThemes>>> getMainThemesList() async {
    try {
      final List<MainThemes> mainThemeListFromLocalStorage =
          await localDataSource.getCachedMainThemesList();

      return Right(mainThemeListFromLocalStorage);
    } on Exception {
      try {
        final List<MainThemes> mainThemeListFromApi =
            await remoteDataSource.getMainThemesList();
        localDataSource
            .cacheMainThemes(mainThemeListFromApi as List<MainThemesModel>);
        return Right(mainThemeListFromApi);
      } on Exception {
        return Left(ApiFailure());
      }
    }
  }
}
