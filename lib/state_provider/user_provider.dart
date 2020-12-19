import 'package:github_profiles/app/data/models/not_found_exception.dart';
import 'package:github_profiles/app/data/models/user_info.dart';
import 'package:github_profiles/app/data/services/github_api.dart';
import 'package:github_profiles/app/routes/app_routes.dart';
import 'package:github_profiles/services/third_party_services.dart';
import 'package:hooks_riverpod/all.dart';

final userControllerProvider = StateNotifierProvider<UserController>((ref) {
  final githubApi = ref.watch(githubApiProvider);
  final navigationService = ref.watch(navigationServiceProvider);
  final dialogService = ref.watch(dialogServiceProvider);
  return UserController(githubApi, navigationService, dialogService);
});

class UserController extends StateNotifier<AsyncValue<UserInfo>> {
  final _githubApi;
  final _navigationService;
  final _dialogService;

  UserController(
    this._githubApi,
    this._navigationService,
    this._dialogService, [
    AsyncValue<UserInfo> state,
  ]) : super(state ??
            AsyncValue.data(UserInfo(
                avatar_url: '',
                bio: '',
                followers: 0,
                following: 0,
                name: '')));

  Future<void> fetchUserInfo(String username) async {
    state = AsyncValue.loading();
    try {
      final UserInfo user = await _githubApi.getUserInfo(username: username);

      state = AsyncValue.data(user);

      _navigationService.navigateTo(AppRoutes.userDetails);
      return user;
    } catch (e) {
      final NotFoundException error =
          NotFoundException(message: e.response.data["message"]);
      state = AsyncValue.error(error.message);
      _dialogService.showDialog(
          title: 'Error',
          description: 'User with this username ${error.message}');
    }
  }

  // Future<void> fetReposInfo(String username) async {
  //   try {
  //     setLoading(true);

  //     final List<ReposInfo> response =
  //         await _githubApi.getRepos(username: username);

  //     _repos = response;
  //     setLoading(false);
  //   } catch (e) {
  //     setLoading(false);
  //   }
  // }

}
