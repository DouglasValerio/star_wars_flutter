import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:star_wars_flutter/core/error/exceptions.dart';

import '../models/main_themes_model.dart';

abstract class MainThemesLocalDataSource {
  /// handles cached data
  /// throws [CacheException] in case of error

  Future<List<MainThemesModel>> getCachedMainThemesList();
  Future<void> cacheMainThemes(List<MainThemesModel> mainThemesList);
}

const cachedData = 'cached_data';

class MainThemesLocalDataSourceImpl implements MainThemesLocalDataSource {
  final FlutterSecureStorage flutterSecureStorage;

  MainThemesLocalDataSourceImpl({this.flutterSecureStorage});

  @override
  Future<void> cacheMainThemes(List<MainThemesModel> mainThemesList) =>
      flutterSecureStorage.write(
        key: cachedData,
        value: jsonEncode(
            List<dynamic>.from(mainThemesList.map((el) => el.toJson()))),
      );

  @override
  Future<List<MainThemesModel>> getCachedMainThemesList() async {
    final jsonString = await flutterSecureStorage.read(key: cachedData);
    if (jsonString != null) {
      final jsonList = json.decode(jsonString) as List<dynamic>;

      return Future.value(
        List<MainThemesModel>.from(
            jsonList.map((el) => MainThemesModel.fromJson(el as String))),
      );
    } else {
      throw CacheException();
    }
  }
}
