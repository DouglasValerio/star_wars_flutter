part of 'main_theme_bloc.dart';

abstract class MainThemeState extends Equatable {
  const MainThemeState();

  @override
  List<Object> get props => [];
}

class EmptyMainTheme extends MainThemeState {}

class LoadingMainThemeState extends MainThemeState {}

class LoadedStateMainTheme extends MainThemeState {
  final List<MainThemes> mainThemeList;

  const LoadedStateMainTheme({this.mainThemeList});
}

class ErrorState extends MainThemeState {}
