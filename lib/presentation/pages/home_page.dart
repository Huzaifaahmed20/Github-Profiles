import 'package:flutter/material.dart';
import 'package:github_profiles/app/data/models/user_info.dart';
import 'package:github_profiles/presentation/notifier/user_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final UserInfo userInfo = context.watch<UserNotifier>().user;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('press this'),
                onPressed: () {
                  context.read<UserNotifier>().fetchUserInfo();
                },
              ),
              Text(userInfo.name ?? '')
            ],
          ),
        ),
      ),
    );
  }
}
