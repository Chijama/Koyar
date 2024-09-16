import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koyar/app/dependencyInj.dart';

import '../presentation/cubit/bottomNavigation/bottom_navigation_cubit.dart';

MultiBlocProvider blocProviders(
    {required BuildContext context, required Widget child}) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => injector<BottomNavigationCubit>(),
      ),
    ],
    child: child,
  );
}
