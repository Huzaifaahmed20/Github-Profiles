import 'package:flutter/material.dart';
import 'package:github_profiles/app/data/models/user_info.dart';
import 'package:github_profiles/presentation/notifier/user_notifier.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserInfo userInfo = Provider.of<UserNotifier>(context).user;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Text('user Details'),
      ),
    );
  }
}
