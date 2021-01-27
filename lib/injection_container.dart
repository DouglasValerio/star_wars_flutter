import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'dependency_injections/homepage_injection.dart';

final serviceLocator = GetIt.instance;
Future<void> init() async {
  //Features layer
  await homepageInjection();

  //Core layer
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(serviceLocator()),
  );
  //External dependencies
  serviceLocator.registerLazySingleton(
    () => FlutterSecureStorage(),
  );
  serviceLocator.registerLazySingleton(
    () => http.Client(),
  );
  serviceLocator.registerLazySingleton(
    () => DataConnectionChecker(),
  );
}
