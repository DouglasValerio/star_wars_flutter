import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/main_themes_item.dart';
import '../../domain/usecases/get_main_themes_item_list.dart';

part 'main_theme_item_event.dart';
part 'main_theme_item_state.dart';

class MainThemeItemBloc extends Bloc<MainThemeItemEvent, MainThemesItemState> {
  final GetMainThemesItemList getMainThemesItemList;
  MainThemeItemBloc({this.getMainThemesItemList}) : super(EmptyMainThemeItem());

  MainThemesItemState get initialState => EmptyMainThemeItem();
  Stream<MainThemesItemState> _eitherLoadedOrErrorState(
    Either<Failure, List<MainThemesItem>> failureOrAvailableOrderList,
  ) async* {
    yield failureOrAvailableOrderList.fold(
      (failure) => ItemErrorState(),
      (mainThemeItemList) =>
          LoadedStateMainItemTheme(mainThemeItemList: mainThemeItemList),
    );
  }

  @override
  Stream<MainThemesItemState> mapEventToState(
    MainThemeItemEvent event,
  ) async* {
    if (event is GetMainThemesItem) {
      yield LoadingMainThemeItemState();
      final Either<Failure, List<MainThemesItem>> apiOutputEither =
          await getMainThemesItemList(StrParams(string: event.url));
      yield* _eitherLoadedOrErrorState(apiOutputEither);
    }
  }
}
