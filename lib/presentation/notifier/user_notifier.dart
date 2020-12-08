import 'package:flutter/foundation.dart';
import 'package:github_profiles/app/data/models/repos_info.dart';
import 'package:github_profiles/app/data/models/user_info.dart';
import 'package:github_profiles/app/data/services/github_api.dart';

class UserNotifier with ChangeNotifier {
  bool isLoading = false;
  GithubApi _githubApi = GithubApi();
  UserInfo _user;
  List<ReposInfo> _repos;
  UserInfo get user => _user;
  List<ReposInfo> get repos => _repos;

  Future<void> fetchUserInfo(String username) async {
    setLoading(true);
    final UserInfo response = await _githubApi.getUserInfo(username: username);

    _user = response;
    setLoading(false);
  }

  Future<void> fetReposInfo(String username) async {
    setLoading(true);

    final List<ReposInfo> response =
        await _githubApi.getRepos(username: username);

    _repos = response;
    setLoading(false);
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
