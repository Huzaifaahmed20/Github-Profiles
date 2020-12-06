import 'dart:convert';

import 'package:github_profiles/app/data/dio_client.dart';
import 'package:github_profiles/app/data/endpoints.dart';
import 'package:github_profiles/app/data/models/user_info.dart';

class GithubApi {
  DioClient _client = DioClient();

  Future<UserInfo> getUserInfo({String username}) async {
    final res = await _client.get('${Endpoints.userInfo}/$username');
    print(res);

    if (res != null) {
      return UserInfo.fromJson(res);
    } else {
      return null;
    }
  }
}
