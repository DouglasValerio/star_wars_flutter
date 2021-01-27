import "package:mockito/mockito.dart";
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:star_wars_flutter/core/usecases/usecase.dart';
import 'package:star_wars_flutter/features/homepage/domain/entities/main_themes.dart';
import 'package:star_wars_flutter/features/homepage/domain/repositories/main_themes_repository.dart';
import 'package:star_wars_flutter/features/homepage/domain/usecases/get_main_themes_list.dart';

class MockMainThemesRepository extends Mock implements MainThemesRepository {}

void main() {
  GetMainThemesList useCase;
  MockMainThemesRepository mockGetMainThemesRepository;
  setUp(() {
    mockGetMainThemesRepository = MockMainThemesRepository();
    useCase = GetMainThemesList(mockGetMainThemesRepository);
  });

  final mainThemesList = [
    MainThemes(apiUrl: 'http://swapi.dev/api/people/', theme: 'people'),
    MainThemes(apiUrl: 'http://swapi.dev/api/people/', theme: 'films')
  ];
  test('should get List of MainThemes from repository', () async {
    // arrange
    when(mockGetMainThemesRepository.getMainThemesList())
        .thenAnswer((realInvocation) async => Right(mainThemesList));

    // act
    final result = await useCase(NoParams());
    // assert
    expect(result, Right(mainThemesList));
    verify(mockGetMainThemesRepository.getMainThemesList());
    verifyNoMoreInteractions(mockGetMainThemesRepository);
  });
}
