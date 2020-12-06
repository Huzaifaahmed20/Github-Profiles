import 'package:flutter/foundation.dart';

class UserInfo {
  String name, avatar_url, bio;
  int followers, following;

  UserInfo({
    @required this.name,
    @required this.avatar_url,
    @required this.followers,
    @required this.following,
  });

  UserInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar_url = json['avatar_url'];
    followers = json['followers'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['avatar_url'] = this.avatar_url;
    data['followers'] = this.followers;
    data['following'] = this.following;
    return data;
  }
}
