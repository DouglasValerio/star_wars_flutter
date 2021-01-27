import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:star_wars_flutter/features/homepage/data/models/main_themes_model.dart';
import 'package:star_wars_flutter/features/homepage/domain/entities/main_themes.dart';

import '../../../fixtures/fixtures_reader.dart';

void main() {
  final mainThemesModelList = [
    MainThemesModel(theme: "people", apiUrl: "http://swapi.dev/api/people/"),
    MainThemesModel(theme: "planets", apiUrl: "http://swapi.dev/api/planets/")
  ];

  test(
    'should extend MainThemes',
    () async {
      // assert
      expect(mainThemesModelList, isA<List<MainThemes>>());
    },
  );
  group('fromJson', () {
    test('should return valid model from JSON', () async {
      // arrange
      final jsonMap =
          jsonDecode(fixture('main_api_response.json')) as Map<String, dynamic>;

      // act
      final result = mainThemesModelListFromJson(jsonMap);
      // assert
      expect(result, equals(mainThemesModelList));
    });
  });
}
