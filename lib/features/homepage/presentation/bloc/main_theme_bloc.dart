import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../categories_itens_page/domain/entities/main_themes_item.dart';
import '../../../categories_itens_page/domain/usecases/get_main_themes_item_list.dart';
import '../../domain/entities/main_themes.dart';
import '../../domain/usecases/get_main_themes_list.dart';

part 'main_theme_event.dart';
part 'main_theme_state.dart';

class MainThemeBloc extends Bloc<MainThemeEvent, MainThemeState> {
  final GetMainThemesList getMainThemesList;
  final GetMainThemesItemList getMainThemesItemList;
  MainThemeBloc({
    this.getMainThemesList,
    this.getMainThemesItemList,
  })  : assert(getMainThemesItemList != null),
        assert(getMainThemesList != null),
        super(EmptyMainTheme());

  MainThemeState get initialState => EmptyMainTheme();

  Stream<MainThemeState> _eitherLoadedOrErrorState(
    Either<Failure, List<MainThemes>> failureOrMainTheme,
  ) async* {
    yield failureOrMainTheme.fold(
      (failure) => ErrorState(),
      (mainThemeList) => LoadedStateMainTheme(mainThemeList: mainThemeList),
    );
  }

  Stream<MainThemeState> _eitherCategoriesOrErrorState(
    Either<Failure, List<MainThemesItem>> failureOrCategories,
  ) async* {
    yield failureOrCategories.fold(
      (failure) => ErrorState(),
      (categories) => LoadedCategories(categoriesList: categories),
    );
  }

  @override
  Stream<MainThemeState> mapEventToState(
    MainThemeEvent event,
  ) async* {
    if (event is GetMainThemes) {
      yield LoadingMainThemeState();
      final Either<Failure, List<MainThemes>> apiOutputEither =
          await getMainThemesList(NoParams());
      yield* _eitherLoadedOrErrorState(apiOutputEither);
    } else if (event is GetCategoriesList) {
      final Either<Failure, List<MainThemesItem>> apiOutputEither =
          await getMainThemesItemList(StrParams(string: event.url));
      yield* _eitherCategoriesOrErrorState(apiOutputEither);
    }
  }
}
