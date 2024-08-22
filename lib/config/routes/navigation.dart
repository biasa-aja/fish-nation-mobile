import 'package:example_fish_fortune/config/routes/bottom_navigation_page.dart';
import 'package:example_fish_fortune/config/routes/route_path.dart';
import 'package:example_fish_fortune/presentation/pages/collection/collection_page.dart';
import 'package:example_fish_fortune/presentation/pages/fishing/fishing_page.dart';
import 'package:example_fish_fortune/presentation/pages/home/home_page.dart';
import 'package:example_fish_fortune/presentation/pages/login/login_page.dart';
import 'package:example_fish_fortune/presentation/pages/profile/profile_page.dart';
import 'package:example_fish_fortune/presentation/pages/my_fish_road/my_fish_road_page.dart';
import 'package:example_fish_fortune/presentation/pages/register/register_page.dart';
import 'package:example_fish_fortune/presentation/pages/shop/shop_page.dart';
import 'package:example_fish_fortune/presentation/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Navigation {
  static final GlobalKey<NavigatorState> baseNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> homeNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> collectionNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> shopNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> rankingsNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> profileNavigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  static GoRouterDelegate get routerDelegate => router.routerDelegate;

  static GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  static final branches = <StatefulShellBranch>[
    StatefulShellBranch(
      navigatorKey: homeNavigatorKey,
      routes: [
        GoRoute(
          path: RoutePath.home,
          pageBuilder: (context, GoRouterState state) {
            return _getPage(
              child: const HomePage(),
              state: state,
            );
          },
        ),
      ],
    ),
    StatefulShellBranch(
      navigatorKey: collectionNavigatorKey,
      routes: [
        GoRoute(
          path: RoutePath.collection,
          pageBuilder: (context, GoRouterState state) {
            return _getPage(
              child: const CollectionPage(),
              state: state,
            );
          },
        ),
      ],
    ),
    StatefulShellBranch(
      navigatorKey: shopNavigatorKey,
      routes: [
        GoRoute(
          path: RoutePath.shop,
          pageBuilder: (context, GoRouterState state) {
            return _getPage(
              child: const ShopPage(),
              state: state,
            );
          },
        ),
      ],
    ),
    StatefulShellBranch(
      navigatorKey: rankingsNavigatorKey,
      routes: [
        GoRoute(
          path: RoutePath.myFishRoad,
          pageBuilder: (context, GoRouterState state) {
            return _getPage(
              child: const MyFishRoadPage(),
              state: state,
            );
          },
        ),
      ],
    ),
    StatefulShellBranch(
      navigatorKey: profileNavigatorKey,
      routes: [
        GoRoute(
          path: RoutePath.profile,
          pageBuilder: (context, GoRouterState state) {
            return _getPage(
              child: const ProfilePage(),
              state: state,
            );
          },
        ),
      ],
    ),
  ];

  static final List<RouteBase> _routes = [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: baseNavigatorKey,
      branches: branches,
      pageBuilder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return _getPage(
          child: BottomNavigationPage(
            child: navigationShell,
          ),
          state: state,
        );
      },
    ),
    GoRoute(
      path: RoutePath.welcome,
      pageBuilder: (context, GoRouterState state) {
        return _getPage(
          child: const WelcomePage(),
          state: state,
        );
      },
    ),
    GoRoute(
      path: RoutePath.login,
      pageBuilder: (context, GoRouterState state) {
        return _getPage(
          child: const LoginPage(),
          state: state,
        );
      },
    ),
    GoRoute(
      path: RoutePath.register,
      pageBuilder: (context, GoRouterState state) {
        return _getPage(
          child: const RegisterPage(),
          state: state,
        );
      },
    ),
    GoRoute(
      path: RoutePath.fishing,
      pageBuilder: (context, GoRouterState state) {
        return _getPage(
          child: const FishingPage(),
          state: state,
        );
      },
    ),
  ];

  static Page _getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }

  static GoRouter router = GoRouter(
    navigatorKey: baseNavigatorKey,
    initialLocation: RoutePath.welcome,
    routes: _routes,
  );
}
