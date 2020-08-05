import 'package:get_it/get_it.dart';
import 'package:moneymanager/core/viewmodels/details_model.dart';

import 'core/services/category_icon_service.dart';
import 'core/services/moordatabase_service.dart';
import 'core/viewmodels/home_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => CategoryIconService());
  locator.registerLazySingleton(() => MoorDatabaseService());

  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => DetailsModel());
}
