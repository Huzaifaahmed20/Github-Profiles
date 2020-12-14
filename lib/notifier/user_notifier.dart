import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_profiles/app/data/models/not_found_exception.dart';
import 'package:github_profiles/app/data/models/repos_info.dart';
import 'package:github_profiles/app/data/models/user_info.dart';
import 'package:github_profiles/app/data/services/github_api.dart';
import 'package:github_profiles/app/locator.dart';
import 'package:github_profiles/app/routes/app_routes.dart';
import 'package:stacked_services/stacked_services.dart';

class UserNotifier with ChangeNotifier {
  GithubApi _githubApi = GithubApi();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();

  bool isLoading = false;

  UserInfo _user;
  UserInfo get user => _user;

  List<ReposInfo> _repos;
  List<ReposInfo> get repos => _repos;

  Future<void> fetchUserInfo(String username) async {
    setLoading(true);
    try {
      final UserInfo response =
          await _githubApi.getUserInfo(username: username);

      _user = response;
      setLoading(false);
      _navigationService.navigateTo(AppRoutes.userDetails);
    } catch (e) {
      final NotFoundException error =
          NotFoundException(message: e.response.data["message"]);
      setLoading(false);
      _dialogService.showDialog(
          title: 'Error',
          description: 'User with this username ${error.message}');
    }
  }

  Future<void> fetReposInfo(String username) async {
    try {
      setLoading(true);

      final List<ReposInfo> response =
          await _githubApi.getRepos(username: username);

      _repos = response;
      setLoading(false);
    } catch (e) {
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
