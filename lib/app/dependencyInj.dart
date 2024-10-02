import 'package:get_it/get_it.dart';
import 'package:koyar/presentation/cubit/cubit/custom_dropdownsearch_cubit.dart';

import '../presentation/cubit/bottomNavigation/bottom_navigation_cubit.dart';

final injector = GetIt.instance;

Future<void> initDependencyInjector() async {
  //!Cubit
  injector.registerLazySingleton<BottomNavigationCubit>(
      () => BottomNavigationCubit());
  injector.registerLazySingleton<CustomDropdownsearchCubit>(() => CustomDropdownsearchCubit());
}
