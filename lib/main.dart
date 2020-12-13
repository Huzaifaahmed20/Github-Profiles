import 'package:flutter/material.dart';
import 'package:github_profiles/app/locator.dart';
import 'package:github_profiles/app/routes/app_routes.dart';
import 'package:github_profiles/presentation/notifier/user_notifier.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserNotifier>(
      create: (_) => UserNotifier(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: AppRoutes.home,
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
