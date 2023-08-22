import 'package:get_it/get_it.dart';
import 'package:seenear/src/features/common/splash/viewmodel/splash_view_model.dart';

void setupLocator() {
  GetIt getIt = GetIt.instance;
  getIt.registerLazySingleton<SplashViewModel>(() => SplashViewModel());
}
