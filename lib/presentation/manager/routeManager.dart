import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/features/auth/signup/pages/ninPage.dart';

import '../common/cutomePageTransition.dart';
import '../features/auth/signup/pages/electionPreference.dart';
import '../features/auth/signup/pages/lga.dart';
import '../features/auth/signup/pages/stateOfOrigin.dart';
import '../features/getStarted/getStarted.dart';
import '../features/splash.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>();

class BaseRouteName {
  static const getStarted = '/getStarted';
  static const ninPage = '/ninPage';
  static const stateOfOriginPage = '/ninPage/stateOfOriginPage';
  static const lgaPage = '/ninPage/stateOfOriginPage/lgaPage';
  static const electionPreferencePage =
      '/ninPage/stateOfOriginPage/lgaPage/electionPreferencePage';
}

class SubRouteName {
  static const stateOfOriginPage = "stateOfOriginPage";
  static const lgaPage = "lgaPage";
  static const electionPreferencePage = "electionPreferencePage";
}

class AppRouter {
  static final approuter = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigationKey,
    routes: [
      //!Splash Screen
      GoRoute(
        builder: (context, state) {
          return const SplashScreen();
        },
        path: '/',
      ),
      //! Getstarted screen
      GoRoute(
        parentNavigatorKey: _rootNavigationKey,
        pageBuilder: (context, state) {
          return customTransitionPage(
            pageKey: state.pageKey,
            child: const GetStarted(),
          );
        },
        path: BaseRouteName.getStarted,
      ),
      //! NIN Page
      GoRoute(
        routes: [
          //! State of Origin
          GoRoute(
            routes: [
              //! LGA page
              GoRoute(
                routes: [
                  //! Election Preference
                  GoRoute(
                    parentNavigatorKey: _rootNavigationKey,
                    pageBuilder: (context, state) {
                      return customTransitionPage(
                        pageKey: state.pageKey,
                        child: const ElectionPreferencePage(),
                      );
                    },
                    path: SubRouteName.electionPreferencePage,
                  ),
                ],
                parentNavigatorKey: _rootNavigationKey,
                pageBuilder: (context, state) {
                  return customTransitionPage(
                    pageKey: state.pageKey,
                    child: const LGAscreen(),
                  );
                },
                path: SubRouteName.lgaPage,
              ),
            ],
            parentNavigatorKey: _rootNavigationKey,
            pageBuilder: (context, state) {
              return customTransitionPage(
                pageKey: state.pageKey,
                child: const StateOfOriginScreen(),
              );
            },
            path: SubRouteName.stateOfOriginPage,
          ),
        ],
        parentNavigatorKey: _rootNavigationKey,
        pageBuilder: (context, state) {
          return customTransitionPage(
            pageKey: state.pageKey,
            child: const NINPage(),
          );
        },
        path: BaseRouteName.ninPage,
      ),
    ],
  );
}
