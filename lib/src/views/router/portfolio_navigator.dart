import 'package:flutter/material.dart';
import 'package:portfolio/src/views/router/almanach_router_delegate.dart';

import 'portfolio_routes.dart';

abstract class PortfolioNavigator {
  static void landing(BuildContext context) {
    (Router.of(context).routerDelegate as PortfolioRouterDelegate).route = LandingRoute();
  }
}
