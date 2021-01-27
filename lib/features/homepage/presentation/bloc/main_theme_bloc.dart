import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

import '../../domain/entities/main_themes.dart';
import '../../domain/usecases/get_main_themes_list.dart';

part 'main_theme_event.dart';
part 'main_theme_state.dart';

class MainThemeBloc extends Bloc<MainThemeEvent, MainThemeState> {
  final GetMainThemesList getMainThemesList;
  MainThemeBloc({this.getMainThemesList}) : super(EmptyMainTheme());

  MainThemeState get initialState => EmptyMainTheme();
  Stream<MainThemeState> _eitherLoadedOrErrorState(
    Either<Failure, List<MainThemes>> failureOrAvailableOrderList,
  ) async* {
    yield failureOrAvailableOrderList.fold(
      (failure) => ErrorState(),
      (mainThemeList) => LoadedStateMainTheme(mainThemeList: mainThemeList),
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
    }
  }
}
