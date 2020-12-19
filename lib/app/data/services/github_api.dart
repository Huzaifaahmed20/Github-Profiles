import 'package:github_profiles/app/data/dio_client.dart';
import 'package:github_profiles/app/data/endpoints.dart';
import 'package:github_profiles/app/data/models/repos_info.dart';
import 'package:github_profiles/app/data/models/user_info.dart';
import 'package:hooks_riverpod/all.dart';

final githubApiProvider = Provider<GithubApi>((ref) {
  return GithubApi();
});

class GithubApi {
  DioClient _client = DioClient();

  Future<UserInfo> getUserInfo({String username}) async {
    try {
      final res = await _client.get('${Endpoints.userInfo}/$username');
      return UserInfo.fromJson(res);
    } catch (e) {
      throw e;
    }
  }

  Future<List<ReposInfo>> getRepos({String username}) async {
    List<ReposInfo> _repos = [];
    final List res =
        await _client.get('${Endpoints.userInfo}/$username/${Endpoints.repos}');
    try {
      _repos = res.map((e) => ReposInfo.fromMap(e)).toList();
      return _repos;
    } catch (e) {
      throw e;
    }
  }
}
