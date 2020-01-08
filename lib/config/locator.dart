import 'package:banhxeo/dao/user_dao.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator(){
  locator.registerLazySingleton<UserDao>(() =>UserDao());
}
