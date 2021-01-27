import 'package:equatable/equatable.dart';

class MainThemes extends Equatable {
  final String theme;
  final String apiUrl;
  const MainThemes({
    this.theme,
    this.apiUrl,
  });
  @override
  List<Object> get props => [theme, apiUrl];
}
