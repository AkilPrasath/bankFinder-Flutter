import 'package:bank_finder/data/API-service.dart';
import 'package:bank_finder/data/client_service.dart';
import 'package:bank_finder/data/moor_database.dart';
import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();
bool isTest = false;
void setupLocator() {
  locator.registerSingleton(AppDatabase());
  locator.registerSingleton(BankApiService.create());
  locator.registerSingleton(Client());
  locator.registerSingleton(Connectivity());
}
