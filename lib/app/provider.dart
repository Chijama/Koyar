import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koyar/app/dependencyInj.dart';
import 'package:koyar/presentation/cubit/cubit/custom_dropdownsearch_cubit.dart';

import '../presentation/cubit/bottomNavigation/bottom_navigation_cubit.dart';

MultiBlocProvider blocProviders(
    {required BuildContext context, required Widget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => injector<BottomNavigationCubit>(),
      ),BlocProvider(
        create: (context) => injector<CustomDropdownsearchCubit>(),
      ),
    ],
    child: child,
  );
}
