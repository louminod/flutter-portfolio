import 'package:flutter/material.dart';
import 'package:portfolio/src/views/router/portfolio_routes.dart';
import 'package:portfolio/src/views/screens/landing/landing_screen.dart';

class PortfolioRouterDelegate extends RouterDelegate<PortfolioRoute> with ChangeNotifier, PopNavigatorRouterDelegateMixin<PortfolioRoute> {
  PortfolioRoute _route = LandingRoute();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(PortfolioRoute configuration) async {
    route = configuration;
  }

  PortfolioRoute get route => _route;

  set route(PortfolioRoute value) {
    if (_route != value) {
      _route = value;
      notifyListeners();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: <Page<void>>[
        if (_route.runtimeType == LandingRoute) const MaterialPage(key: ValueKey('landing'), child: LandingScreen()),
      ],
      onPopPage: (Route<dynamic> route, dynamic result) {
        final bool success = route.didPop(result);
        if (success) {
          route = LandingRoute() as Route;
          notifyListeners();
        }
        return success;
      },
    );
  }
}
