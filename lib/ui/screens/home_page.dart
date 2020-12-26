import 'package:flutter/material.dart';
import 'package:github_profiles/notifier/user_notifier.dart';
import 'package:github_profiles/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final model = context.watch<UserNotifier>();

    Future<void> getUserInfo(BuildContext ctx) async {
      if (userNameController.text.isEmpty) return;
      await context
          .read<UserNotifier>()
          .fetchUserInfo(userNameController.text, ctx);
      await context
          .read<UserNotifier>()
          .fetReposInfo(userNameController.text, ctx);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://icon-library.com/images/github-icon-white/github-icon-white-6.jpg',
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: userNameController,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 3.0)),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0),
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ProfileButton(
                isLoading: model.isLoading,
                onPressed: () => getUserInfo(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
