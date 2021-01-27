import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/async_usecase.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/main_themes_item.dart';
import '../repositories/main_themes_item_repository.dart';

class GetMainThemesItemList
    implements AsyncListUseCase<MainThemesItem, StrParams> {
  final MainThemesItemRepository mainThemesRepository;

  GetMainThemesItemList(this.mainThemesRepository);

  @override
  Future<Either<Failure, List<MainThemesItem>>> call(StrParams params) async =>
      await mainThemesRepository.getMainThemesItemList(params.string);
}
