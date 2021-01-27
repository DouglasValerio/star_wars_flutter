import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../../../env_variables.dart';
import '../../domain/entities/main_themes.dart';
import '../models/main_themes_model.dart';

abstract class MainThemesRemoteDataSource {
  ///Calls Star Wars API to get a list of [MainThemes]
  ///throws [ApiException] in case of any error while getting data
  Future<List<MainThemes>> getMainThemesList();
}

class MainThemesRemoteDataSourceImpl implements MainThemesRemoteDataSource {
  final http.Client httpClient;

  MainThemesRemoteDataSourceImpl({this.httpClient});
  @override
  Future<List<MainThemes>> getMainThemesList() async {
    String url = apiEndpoint;
    http.Response response = await httpClient.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap =
          json.decode(response.body) as Map<String, dynamic>;
      return mainThemesModelListFromJson(jsonMap);
    } else {
      throw ApiException(response.reasonPhrase, response.statusCode);
    }
  }
}
