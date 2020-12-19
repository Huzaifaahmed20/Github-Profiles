import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final navigationServiceProvider = Provider<NavigationService>((ref) {
  return NavigationService();
});

final dialogServiceProvider = Provider<DialogService>((ref) {
  return DialogService();
});
