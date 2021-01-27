import '../features/categories_itens_page/data/repositories/main_themes_item_repository_impl.dart';
import '../features/categories_itens_page/data/sources/main_themes_item_remote_data_source.dart';
import '../features/categories_itens_page/domain/repositories/main_themes_item_repository.dart';
import '../features/categories_itens_page/domain/usecases/get_main_themes_item_list.dart';

import '../injection_container.dart';

Future<void> categoriesPageInjection() async {
  serviceLocator.registerLazySingleton(
    () => GetMainThemesItemList(serviceLocator()),
  );
  serviceLocator.registerLazySingleton<MainThemesItemRepository>(
      () => MainThemesItemRepositoryImpl(remoteDataSource: serviceLocator()));
  serviceLocator.registerLazySingleton<MainThemesItemRemoteDataSource>(
    () => MainThemesItemRemoteDataSourceImpl(httpClient: serviceLocator()),
  );
}
