import 'package:flutter/material.dart';
import 'package:open_weather/src/features/home/presentation/screens/home_screen.dart';

import '../app_consts/app_consts.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case kRouteHomeView:
        return _buildRoute(settings, const HomeScreen());

      default:
        return _buildRoute(settings, const HomeScreen());
    }
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}