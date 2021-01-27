part of 'main_theme_item_bloc.dart';

abstract class MainThemeItemEvent extends Equatable {
  const MainThemeItemEvent();

  @override
  List<Object> get props => [];
}

class GetMainThemesItem extends MainThemeItemEvent {
  final String url;

  const GetMainThemesItem(this.url);
}
