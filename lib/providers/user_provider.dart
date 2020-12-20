import 'package:dio/dio.dart';
import 'package:github_profiles/app/data/exceptions.dart';
import 'package:github_profiles/app/data/models/user_info.dart';
import 'package:github_profiles/app/data/services/github_api.dart';
import 'package:github_profiles/services/third_party_services.dart';
import 'package:hooks_riverpod/all.dart';

final userControllerProvider = StateNotifierProvider<UserController>((ref) {
  final githubApi = ref.watch(githubApiProvider);
  final dialogService = ref.watch(dialogServiceProvider);
  return UserController(githubApi, dialogService);
});

class UserController extends StateNotifier<AsyncValue<UserInfo>> {
  final _githubApi;
  final _dialogService;

  UserController(
    this._githubApi,
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

      return user;
    } on DioError catch (dioError) {
      final error = DioExceptions.fromDioError(dioError).toString();
      state = AsyncValue.error(error);
      _dialogService.showDialog(title: 'Error', description: '$error');
      return;
    }
  }
}
