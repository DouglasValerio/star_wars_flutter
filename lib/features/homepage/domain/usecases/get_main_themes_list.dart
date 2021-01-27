import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/async_usecase.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/main_themes.dart';
import '../repositories/main_themes_repository.dart';

class GetMainThemesList implements AsyncListUseCase<MainThemes, NoParams> {
  final MainThemesRepository mainThemesRepository;

  GetMainThemesList(this.mainThemesRepository);

  @override
  Future<Either<Failure, List<MainThemes>>> call(NoParams params) async =>
      await mainThemesRepository.getMainThemesList();
}
