import 'package:get_it/get_it.dart';

import 'core/services/authentication_service.dart';

import 'core/viewmodels/home_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());

  locator.registerFactory(() => HomeModel());
}
