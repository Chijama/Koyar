import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/signup/pages/ninPage.dart';
import '../features/candidatesDetails/candidateDetails.dart';
import '../features/candidatesDetails/candidatesComparisonPage.dart';
import '../features/candidates/candidatesSelectionPage.dart';
import '../features/mainPages/profile/profile.dart';
import '../features/mainPages/scaffoldWithNavBar.dart';
import '../features/news/newsDetailsPage.dart';
import '../features/news/newsModel.dart';
import '../features/news/newsPage.dart';
import '../features/pollingUnitLocator/pollingUnitLocator.dart';
import '../features/voterRegisterationCheck/voterRegistrationCheckPage.dart';
import '../features/votersGuide/votersGuide.dart';
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
  static const candidatesSelectionPage = '/home/candidatesSelectionPage';
  static const newsPage = '/home/newsPage';
  static const profile = '/home/profile';
  static const getStarted = '/getStarted';
  static const ninPage = '/ninPage';
  static const stateOfOriginPage = '/ninPage/stateOfOriginPage';
  static const newsDetailPage = "/home/newsPage/newsDetailPage";
  static const lgaPage = '/ninPage/stateOfOriginPage/lgaPage';
  static const electionPreferencePage =
      '/ninPage/stateOfOriginPage/lgaPage/electionPreferencePage';
  static const candidatesComparisonPage =
      "/home/candidatesSelectionPage/candidatesComparisonPage";
  static const voterRegistrationCheckPage = "/home/voterRegistrationCheckPage";
  static const pollingUnitLocatorPage = "/home/pollingUnitLocatorPage";
  static const votersGuidePage = "/home/votersGuidePage";
  static const candidatesDetailsPage =
      "/home/candidatesSelectionPage/candidatesDetailsPage";
}

class SubRouteName {
  static const stateOfOriginPage = "stateOfOriginPage";
  static const lgaPage = "lgaPage";
  static const candidatesSelectionPage = 'candidatesSelectionPage';
  static const profile = 'profile';
  static const electionPreferencePage = "electionPreferencePage";

  static const candidatesComparisonPage = "candidatesComparisonPage";
  static const voterRegistrationCheckPage = "voterRegistrationCheckPage";
  static const pollingUnitLocatorPage = "pollingUnitLocatorPage";
  static const candidatesDetailsPage = "candidatesDetailsPage";
  static const votersGuidePage = "votersGuidePage";
  static const newsPage = "newsPage";
  static const newsDetailPage = "newsDetailPage";
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
              // ! LGA of registeration
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
                  final stateItemSelected = state.extra as String?;
                  return customTransitionPage(
                    pageKey: state.pageKey,
                    child: LGAscreen(stateItemSelected: stateItemSelected ?? ''),
                  );
                },
                path: SubRouteName.lgaPage,
              )
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
          //! Home
          GoRoute(
            routes: [
              //! Candidates Selection
              GoRoute(
                path: SubRouteName.candidatesSelectionPage,
                parentNavigatorKey: _shellNavidationKey,
                pageBuilder: (context, state) {
                  if (kDebugMode) {
                    debugPrint(state.fullPath);
                  }
                  return customTransitionPage(
                    pageKey: state.pageKey,
                    child: const CandidateSelectionPage(),
                  );
                },
              ),
              //! News Page
              GoRoute(
                path: SubRouteName.newsPage,
                parentNavigatorKey: _shellNavidationKey,
                pageBuilder: (context, state) {
                  if (kDebugMode) {
                    debugPrint(state.fullPath);
                  }
                  return customTransitionPage(
                    pageKey: state.pageKey,
                    child: const NewsPage(),
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
      //! Candidate Comparison
      GoRoute(
        parentNavigatorKey: _rootNavigationKey,
        pageBuilder: (context, state) {
          return customTransitionPage(
            pageKey: state.pageKey,
            child: const CandidatesComparisonPage(),
          );
        },
        path: BaseRouteName.candidatesComparisonPage,
      ),
      //! Voter Registeration Check
      GoRoute(
        path: BaseRouteName.voterRegistrationCheckPage,
        parentNavigatorKey: _rootNavigationKey,
        pageBuilder: (context, state) {
          if (kDebugMode) {
            debugPrint(state.fullPath);
          }
          return customTransitionPage(
            pageKey: state.pageKey,
            child: const VoterRegistrationCheckPage(),
          );
        },
      ),
      //! Polling Unit Locator
      GoRoute(
        parentNavigatorKey: _rootNavigationKey,
        pageBuilder: (context, state) {
          return customTransitionPage(
            pageKey: state.pageKey,
            child: const PollingUnitLocatorPage(),
          );
        },
        path: BaseRouteName.pollingUnitLocatorPage,
      ),
      //! Voter's Guide
      GoRoute(
        parentNavigatorKey: _rootNavigationKey,
        pageBuilder: (context, state) {
          return customTransitionPage(
            pageKey: state.pageKey,
            child: const VotingGuidePage(),
          );
        },
        path: BaseRouteName.votersGuidePage,
      ), //! Candidate's Details
      GoRoute(
        parentNavigatorKey: _rootNavigationKey,
        pageBuilder: (context, state) {
          return customTransitionPage(
            pageKey: state.pageKey,
            child: const CandidateDetailsPage(),
          );
        },
        path: BaseRouteName.candidatesDetailsPage,
      ),
      //! News Details
      GoRoute(
        parentNavigatorKey: _rootNavigationKey,
        builder: (context, state) {
          // Access the passed argument
          final newsItem = state.extra as NewsItem;
          return NewsDetailPage(newsItem: newsItem);
        },
        path: BaseRouteName.newsDetailPage,
      ),
    ],
  );
}
