import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/main_themes_item.dart';

abstract class MainThemesItemRepository {
  Future<Either<Failure, List<MainThemesItem>>> getMainThemesItemList(
      String url);
}
