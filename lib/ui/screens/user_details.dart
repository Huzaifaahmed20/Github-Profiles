import 'package:flutter/material.dart';
import 'package:github_profiles/notifier/user_notifier.dart';
import 'package:provider/provider.dart';
import 'package:github_profiles/ui/widgets/widgets.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userInfo = context.watch<UserNotifier>().user;
    final reposInfo = context.watch<UserNotifier>().repos;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          UserProile(userInfo: userInfo),
          const SizedBox(height: 20),
          FollowersDetails(userInfo: userInfo),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Repositories',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ReposGrid(reposInfo: reposInfo)
        ],
      ),
    );
  }
}
