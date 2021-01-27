import '../features/homepage/data/repositories/main_themes_repository_impl.dart';
import '../features/homepage/data/sources/main_themes_remote_data_source.dart';
import '../features/homepage/domain/repositories/main_themes_repository.dart';
import '../features/homepage/domain/usecases/get_main_themes_list.dart';
import '../features/homepage/presentation/bloc/main_theme_bloc.dart';
import '../injection_container.dart';

Future<void> homepageInjection() async {
  //Features layer
  serviceLocator.registerFactory(
    () => MainThemeBloc(getMainThemesList: serviceLocator()),
  );
  serviceLocator.registerLazySingleton(
    () => GetMainThemesList(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<MainThemesRepository>(
      () => MainThemesRepositoryImpl(remoteDataSource: serviceLocator()));
  serviceLocator.registerLazySingleton<MainThemesRemoteDataSource>(
    () => MainThemesRemoteDataSourceImpl(httpClient: serviceLocator()),
  );
}
