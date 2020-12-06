import 'package:flutter/material.dart';
import 'package:github_profiles/presentation/notifier/user_notifier.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserNotifier>().user;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 50),
          ListTile(
            isThreeLine: true,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(userInfo.avatar_url),
            ),
            title: Text(
              userInfo.name ?? '',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              userInfo.bio ?? '',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
          )
        ],
      ),
    );
  }
}
