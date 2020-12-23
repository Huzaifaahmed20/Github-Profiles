import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:github_profiles/app/data/exceptions.dart';
import 'package:github_profiles/app/data/models/repos_info.dart';
import 'package:github_profiles/app/data/models/user_info.dart';
import 'package:github_profiles/app/data/services/github_api.dart';
import 'package:github_profiles/app/routes/app_routes.dart';
import 'package:github_profiles/ui/widgets/show_dialog.dart';

class UserNotifier with ChangeNotifier {
  GithubApi _githubApi = GithubApi();

  bool isLoading = false;

  UserInfo _user;
  UserInfo get user => _user;

  List<ReposInfo> _repos;
  List<ReposInfo> get repos => _repos;

  Future<void> fetchUserInfo(String username, BuildContext context) async {
    setLoading(true);
    try {
      final UserInfo response =
          await _githubApi.getUserInfo(username: username);

      _user = response;
      setLoading(false);
    } catch (dioError) {
      final error = DioExceptions.fromDioError(dioError).toString();
      showCustomDialog(context, 'Error', error);
      setLoading(false);
    }
  }

  Future<void> fetReposInfo(String username, BuildContext context) async {
    try {
      setLoading(true);

      final List<ReposInfo> response =
          await _githubApi.getRepos(username: username);

      _repos = response;
      setLoading(false);
      navigateTo(context, AppRoutes.userDetails);
    } catch (dioError) {
      final error = DioExceptions.fromDioError(dioError).toString();
      showCustomDialog(context, 'Error', error);
      setLoading(false);
    }
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void navigateTo(BuildContext ctx, String routeName) {
    Navigator.of(ctx).pushNamed(routeName);
  }
}
