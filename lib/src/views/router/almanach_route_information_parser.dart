import 'package:flutter/cupertino.dart';
import 'package:portfolio/src/views/router/portfolio_routes.dart';

class PortfolioRouteInformationParser extends RouteInformationParser<PortfolioRoute> {
  @override
  Future<PortfolioRoute> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return LandingRoute();
    } else {
      return LandingRoute();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(PortfolioRoute configuration) {
    switch (configuration.runtimeType) {
      case LandingRoute:
        return const RouteInformation(location: '/');
      default:
        return const RouteInformation(location: '/');
    }
  }
}
