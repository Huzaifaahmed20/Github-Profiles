import 'package:flutter/material.dart';
import 'package:github_profiles/app/data/models/user_info.dart';

class UserProile extends StatelessWidget {
  final UserInfo userInfo;

  const UserProile({
    Key key,
    this.userInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(userInfo.avatar_url),
      ),
      title: Text(
        userInfo.name ?? '',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        userInfo.bio ?? '',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
