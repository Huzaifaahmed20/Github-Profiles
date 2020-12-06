import 'package:github_profiles/app/data/dio_client.dart';
import 'package:github_profiles/app/data/endpoints.dart';
import 'package:github_profiles/app/data/models/repos_info.dart';
import 'package:github_profiles/app/data/models/user_info.dart';

class GithubApi {
  DioClient _client = DioClient();

  Future<UserInfo> getUserInfo({String username}) async {
    final res = await _client.get('${Endpoints.userInfo}/$username');

    if (res != null) {
      return UserInfo.fromJson(res);
    } else {
      return null;
    }
  }

  Future<List<ReposInfo>> getRepos({String username}) async {
    List<ReposInfo> _repos = [];
    final List res =
        await _client.get('${Endpoints.userInfo}/$username/${Endpoints.repos}');

    if (res != null) {
      _repos = res.map((e) => ReposInfo.fromMap(e)).toList();
      return _repos;
    } else {
      return null;
    }
  }
}
