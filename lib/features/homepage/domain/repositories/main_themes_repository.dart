import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/main_themes.dart';

abstract class MainThemesRepository {
  Future<Either<Failure, List<MainThemes>>> getMainThemesList();
}
