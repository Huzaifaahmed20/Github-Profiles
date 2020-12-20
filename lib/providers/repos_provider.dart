import 'package:dio/dio.dart';
import 'package:github_profiles/app/data/exceptions.dart';
import 'package:github_profiles/app/data/models/repos_info.dart';
import 'package:github_profiles/app/data/services/github_api.dart';
import 'package:github_profiles/app/routes/app_routes.dart';
import 'package:github_profiles/services/third_party_services.dart';
import 'package:hooks_riverpod/all.dart';

final repoControllerProvider = StateNotifierProvider<ReposController>((ref) {
  final githubApi = ref.watch(githubApiProvider);
  final navigationService = ref.watch(navigationServiceProvider);
  return ReposController(githubApi, navigationService);
});

class ReposController extends StateNotifier<AsyncValue<List<ReposInfo>>> {
  final _githubApi;
  final _navigationService;

  ReposController(
    this._githubApi,
    this._navigationService, [
    AsyncValue<List<ReposInfo>> state,
  ]) : super(state ?? AsyncValue.data([ReposInfo(html_url: '', name: '')]));

  Future<void> fetReposInfo(String username) async {
    state = AsyncValue.loading();

    try {
      final List<ReposInfo> repos =
          await _githubApi.getRepos(username: username);
      state = AsyncValue.data(repos);
      _navigationService.navigateTo(AppRoutes.userDetails);
      return repos;
    } on DioError catch (dioError) {
      final error = DioExceptions.fromDioError(dioError);
      state = AsyncValue.error(error);
      return;
    }
  }
}
