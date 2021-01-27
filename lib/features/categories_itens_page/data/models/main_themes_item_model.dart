import 'dart:convert';

import '../../domain/entities/main_themes_item.dart';

class MainThemesItemModel extends MainThemesItem {
  final String name;
  final String url;

  MainThemesItemModel(this.name, this.url);

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  factory MainThemesItemModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MainThemesItemModel(
      (map['name'] ?? map['title']) as String,
      map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainThemesItemModel.fromJson(String source) =>
      MainThemesItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<MainThemesItem> mainThemesItemFromJson(List<dynamic> str) =>
    List<MainThemesItem>.from(
        str.map((x) => MainThemesItemModel.fromMap(x as Map<String, dynamic>)));
