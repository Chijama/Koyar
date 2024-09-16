import 'package:flutter/material.dart';
import 'package:koyar/app/provider.dart';
import 'package:koyar/presentation/manager/themeManager.dart';

import '../presentation/manager/routeManager.dart';

class AppRoot extends StatelessWidget {
  const AppRoot._internal();

  static const AppRoot instance = AppRoot._internal();
  factory AppRoot() => instance;

  @override
  Widget build(BuildContext context) {
    return blocProviders(
      context: context,
      child: MaterialApp.router(
        theme: AppThemeDate().getTheme(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.approuter,
      ),
    );
  }
}
