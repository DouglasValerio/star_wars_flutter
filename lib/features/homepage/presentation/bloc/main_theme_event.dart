part of 'main_theme_bloc.dart';

abstract class MainThemeEvent extends Equatable {
  const MainThemeEvent();

  @override
  List<Object> get props => [];
}

class GetMainThemes extends MainThemeEvent {}

class GetCategoriesList extends MainThemeEvent {
  final String url;
  const GetCategoriesList({
    this.url,
  });
}
