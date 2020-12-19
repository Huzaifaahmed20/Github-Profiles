import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_profiles/state_provider/user_provider.dart';
import 'package:github_profiles/ui/screens/home_page.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:github_profiles/ui/widgets/widgets.dart';
import 'package:github_profiles/app/data/services/github_api.dart';
import 'package:hooks_riverpod/all.dart';

class UserDetails extends HookWidget {
  const UserDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final reposInfo = context.watch<UserNotifier>().repos;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          // UserProile(userInfo: model),

          const SizedBox(height: 20),
          // FollowersDetails(userInfo: model.user),
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
          // ReposGrid(reposInfo: reposInfo)
        ],
      ),
    );
  }
}
