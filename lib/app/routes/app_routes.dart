import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_profiles/ui/screens/screens.dart';

class AppRoutes {
  static const String home = '/';
  static const String userDetails = '/user-details';
  static const String reposWebView = '/repon-web-view';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case userDetails:
        return _buildRoute(UserDetails(), settings);
      case home:
        return _buildRoute(HomePage(), settings);
      case reposWebView:
        return _buildRoute(ReposWebView(), settings);
      default:
        return _buildRoute(HomePage(), settings);
    }
  }

  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
