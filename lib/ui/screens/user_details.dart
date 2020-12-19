import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_profiles/state_provider/user_provider.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:github_profiles/ui/widgets/widgets.dart';

class UserDetails extends HookWidget {
  const UserDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userControllerState = useProvider(userControllerProvider.state);
    return Scaffold(
      backgroundColor: Colors.black,
      body: userControllerState.when(
        data: (user) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            UserProile(userInfo: user),
            const SizedBox(height: 20),
            FollowersDetails(userInfo: user),
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
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, _) =>
            Center(child: Text('An unexpected error occurred 😢')),
      ),
    );
  }
}
