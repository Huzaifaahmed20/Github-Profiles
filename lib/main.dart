import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_profiles/app/routes/app_routes.dart';
import 'package:github_profiles/services/third_party_services.dart';
import 'package:hooks_riverpod/all.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final navigationService = useProvider(navigationServiceProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.home,
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
