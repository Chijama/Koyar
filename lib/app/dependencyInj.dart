import 'package:get_it/get_it.dart';

import '../presentation/cubit/bottomNavigation/bottom_navigation_cubit.dart';

final injector = GetIt.instance;

Future<void> initDependencyInjector() async {
  //!Cubit
  injector.registerLazySingleton<BottomNavigationCubit>(
      () => BottomNavigationCubit());
}
