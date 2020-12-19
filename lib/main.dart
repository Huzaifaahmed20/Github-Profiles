import 'package:flutter/material.dart';
import 'package:github_profiles/app/routes/app_routes.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  // setupLocator();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.home,
      // navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
