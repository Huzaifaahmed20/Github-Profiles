import 'package:flutter/foundation.dart';
import 'package:github_profiles/app/data/models/user_info.dart';
import 'package:github_profiles/app/data/services/github_api.dart';

class UserNotifier with ChangeNotifier {
  bool isLoading = false;
  GithubApi _githubApi = GithubApi();
  UserInfo _user;
  UserInfo get user => _user;

  Future<void> fetchUserInfo(String username) async {
    setLoading(true);
    final UserInfo response = await _githubApi.getUserInfo(username: username);

    _user = response;
    setLoading(false);
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
