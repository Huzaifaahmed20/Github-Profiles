import 'package:flutter/material.dart';
import 'package:github_profiles/presentation/notifier/user_notifier.dart';
import 'package:github_profiles/presentation/widgets/builder_methods.dart';
import 'package:provider/provider.dart';

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
          BuilderMethods.buildProfile(userInfo),
          const SizedBox(height: 20),
          BuilderMethods.buildFollowers(userInfo),
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
          BuilderMethods.buildReposGrid(reposInfo, context)
        ],
      ),
    );
  }
}
