import 'package:flutter/foundation.dart';
import 'package:github_profiles/app/data/models/user_info.dart';
import 'package:github_profiles/app/data/services/github_api.dart';

class UserNotifier with ChangeNotifier {
  GithubApi _githubApi = GithubApi();
  UserInfo _user;
  UserInfo get user => _user;

  Future<void> fetchUserInfo() async {
    final UserInfo response =
        await _githubApi.getUserInfo(username: 'Huzaifaahmed20');

    _user = response;
    notifyListeners();
  }
}
