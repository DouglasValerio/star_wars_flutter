import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/main_themes_item.dart';
import '../../domain/repositories/main_themes_item_repository.dart';
import '../sources/main_themes_item_remote_data_source.dart';

class MainThemesItemRepositoryImpl implements MainThemesItemRepository {
  final MainThemesItemRemoteDataSource remoteDataSource;

  MainThemesItemRepositoryImpl({this.remoteDataSource});

  Future<Either<Failure, List<MainThemesItem>>> getMainThemesItemList(
      String url) async {
    try {
      final List<MainThemesItem> availableOrdersFromDatabase =
          await remoteDataSource.getMainThemesItemList(url);

      return Right(availableOrdersFromDatabase);
    } on Exception {
      return Left(ApiFailure());
    }
  }
}
