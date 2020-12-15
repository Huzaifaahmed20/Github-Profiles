import 'package:flutter/material.dart';
import 'package:github_profiles/app/data/models/user_info.dart';

class FollowersDetails extends StatelessWidget {
  final UserInfo userInfo;
  const FollowersDetails({
    Key key,
    this.userInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            '${userInfo.followers} followers',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 20),
          Text(
            '${userInfo.following} following',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
