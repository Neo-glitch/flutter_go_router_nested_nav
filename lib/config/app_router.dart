import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_go_router_nested_nav/views/home_details_screen.dart';
import 'package:flutter_go_router_nested_nav/views/home_screen.dart';
import 'package:flutter_go_router_nested_nav/views/main_wrapper.dart';
import 'package:flutter_go_router_nested_nav/views/player_screen.dart';
import 'package:flutter_go_router_nested_nav/views/settings_detail_screen.dart';
import 'package:flutter_go_router_nested_nav/views/settings_screen.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  AppNavigator._();

  // first route
  static String initRoute = "/home";

  // NavigatorKeys
  static final _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "root");
  static final _homeNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "shell_home");
  static final _settingsNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: "shell_settings");

  //Go Router Config
  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: initRoute,
    debugLogDiagnostics: true,
    routes: [
      //Main Wrapper route (for the bottom nav bar screen)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapperScreen(
            navigationShell: navigationShell,
          );
        },
        branches: [
          // nested navigator for home
          // similar to flutter default navigator way of implementing nested nav
          // where each bottom nav bar screen is a navigator with it's own route
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: "/home",
                name: "home",
                builder: (context, state) {
                  return HomeScreen(key: state.pageKey);
                },
                routes: [
                  // sub route in home
                  GoRoute(
                    path: "home_details",
                    name: "home_details",
                    builder: (context, state) {
                      return HomeDetailsScreen(key: state.pageKey);
                    },
                  )
                ],
              ),
            ],
          ),

          // Branch Settings (nested navigator for settings)
          StatefulShellBranch(
            navigatorKey: _settingsNavigatorKey,
            routes: [
              GoRoute(
                path: "/settings",
                name: "settings",
                builder: (context, state) {
                  return SettingsScreen(key: state.pageKey);
                },
                routes: [
                  // sub route in home
                  GoRoute(
                    path: "settings_details",
                    name: "settings_details",
                    builder: (context, state) {
                      return SettingsDetailScreen(key: state.pageKey);
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: "/player",
        name: "player",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          return PlayerScreen(
            key: state.pageKey,
          );
        },
      )
    ],
  );
}
