import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/main_themes_item.dart';
import '../models/main_themes_item_model.dart';

abstract class MainThemesItemRemoteDataSource {
  ///Calls Star Wars API to get a list of [MainThemesItem]
  ///throws [ApiException] in case of any error while getting data
  Future<List<MainThemesItem>> getMainThemesItemList(String url);
}

class MainThemesItemRemoteDataSourceImpl
    implements MainThemesItemRemoteDataSource {
  final http.Client httpClient;
  final String url;

  MainThemesItemRemoteDataSourceImpl({this.httpClient, this.url});
  @override
  Future<List<MainThemesItem>> getMainThemesItemList(url) async {
    http.Response response = await httpClient.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonMap =
          json.decode(response.body)['results'] as List<dynamic>;
      return mainThemesItemFromJson(jsonMap);
    } else {
      throw ApiException(response.reasonPhrase, response.statusCode);
    }
  }
}
