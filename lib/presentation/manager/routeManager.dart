import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:koyar/presentation/features/auth/signup/pages/ninPage.dart';
import 'package:koyar/presentation/features/mainPages/candidates/candidates.dart';
import 'package:koyar/presentation/features/mainPages/education/education.dart';
import 'package:koyar/presentation/features/mainPages/profile/profile.dart';
import 'package:koyar/presentation/features/mainPages/scaffoldWithNavBar.dart';

import '../common/cutomePageTransition.dart';
import '../features/auth/signup/pages/electionPreference.dart';
import '../features/auth/signup/pages/lga.dart';
import '../features/auth/signup/pages/stateOfOrigin.dart';
import '../features/getStarted/getStarted.dart';
import '../features/mainPages/home/homePage.dart';
import '../features/splash.dart';

final _rootNavigationKey = GlobalKey<NavigatorState>();
final _shellNavidationKey = GlobalKey<NavigatorState>();

class BaseRouteName {
  static const home = '/home';
  static const candidates = '/home/candidates';
  static const education = '/home/education';
  static const profile = '/home/profile';
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
  static const candidates = 'candidates';
  static const education = 'education';
  static const profile = 'profile';
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

      ShellRoute(
        navigatorKey: _shellNavidationKey,
        pageBuilder: (context, state, child) {
          if (kDebugMode) {
            debugPrint(state.path);
          }
          return CustomTransitionPage(
            key: state.pageKey,
            child: ScaffoldWithNavBar(
              location: state.matchedLocation,
              child: child,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          );
        },
        routes: [
          //!Home
          GoRoute(
            routes: [
              //! Candidates
              GoRoute(
                path: SubRouteName.candidates,
                parentNavigatorKey: _shellNavidationKey,
                pageBuilder: (context, state) {
                  if (kDebugMode) {
                    debugPrint(state.fullPath);
                  }
                  return customTransitionPage(
                    pageKey: state.pageKey,
                    child: const CandidatesPage(),
                  );
                },
              ),
              //! Education
              GoRoute(
                path: SubRouteName.education,
                parentNavigatorKey: _shellNavidationKey,
                pageBuilder: (context, state) {
                  if (kDebugMode) {
                    debugPrint(state.fullPath);
                  }
                  return customTransitionPage(
                    pageKey: state.pageKey,
                    child: const EducationPage(),
                  );
                },
              ),
              //! Profile
              GoRoute(
                path: SubRouteName.profile,
                parentNavigatorKey: _shellNavidationKey,
                pageBuilder: (context, state) {
                  if (kDebugMode) {
                    debugPrint(state.fullPath);
                  }
                  return customTransitionPage(
                    pageKey: state.pageKey,
                    child: const ProfilePage(),
                  );
                },
              ),
            ],
            path: BaseRouteName.home,
            parentNavigatorKey: _shellNavidationKey,
            pageBuilder: (context, state) {
              if (kDebugMode) {
                debugPrint(state.fullPath);
              }
              return customTransitionPage(
                pageKey: state.pageKey,
                child: const HomePage(),
              );
            },
          ),
        ],
      ),
    ],
  );
}
