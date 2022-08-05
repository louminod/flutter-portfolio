import 'package:flutter/material.dart';
import 'package:portfolio/src/views/router/almanach_route_information_parser.dart';
import 'package:portfolio/src/views/router/almanach_router_delegate.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AppView();
  }
}

class AppView extends StatelessWidget {
  final PortfolioRouteInformationParser _informationParser = PortfolioRouteInformationParser();
  final PortfolioRouterDelegate _routerDelegate = PortfolioRouterDelegate();

  AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Louis-Marie Merminod",
      routeInformationParser: _informationParser,
      routerDelegate: _routerDelegate,
    );
  }
}
