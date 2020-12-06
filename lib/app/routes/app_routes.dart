import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_profiles/presentation/pages/pages.dart';

class AppRoutes {
  static const String userDetails = 'user-details';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case userDetails:
        return _buildRoute(UserDetails(), settings);
      default:
        return _buildRoute(HomePage(), settings);
    }
  }

  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
