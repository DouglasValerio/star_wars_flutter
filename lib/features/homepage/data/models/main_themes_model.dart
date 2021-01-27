import 'dart:convert';

import '../../domain/entities/main_themes.dart';

class MainThemesModel extends MainThemes {
  final String theme;
  final String apiUrl;

  const MainThemesModel({
    this.theme,
    this.apiUrl,
  });

  Map<String, dynamic> toMap() => {
        'theme': theme,
        'apiUrl': apiUrl,
      };

  factory MainThemesModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MainThemesModel(
      theme: map['theme'] as String,
      apiUrl: map['apiUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainThemesModel.fromJson(String source) =>
      MainThemesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<MainThemesModel> mainThemesModelListFromJson(Map<String, dynamic> map) {
  List<MainThemesModel> list = [];
  map.forEach((final String key, final value) {
    list.add(new MainThemesModel(theme: key, apiUrl: value as String));
  });
  return list;
}
