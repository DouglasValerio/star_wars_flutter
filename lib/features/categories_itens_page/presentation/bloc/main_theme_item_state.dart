part of 'main_theme_item_bloc.dart';

abstract class MainThemesItemState extends Equatable {
  const MainThemesItemState();

  @override
  List<Object> get props => [];
}

class EmptyMainThemeItem extends MainThemesItemState {}

class LoadingMainThemeItemState extends MainThemesItemState {}

class LoadedStateMainItemTheme extends MainThemesItemState {
  final List<MainThemesItem> mainThemeItemList;

  const LoadedStateMainItemTheme({this.mainThemeItemList});
}

class ItemErrorState extends MainThemesItemState {}
