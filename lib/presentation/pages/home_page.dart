import 'package:flutter/material.dart';
import 'package:github_profiles/app/routes/app_routes.dart';
import 'package:github_profiles/presentation/notifier/user_notifier.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = TextEditingController();
    final model = context.watch<UserNotifier>();

    Future<void> getUserInfo() async {
      if (userNameController.text.isEmpty) return;
      await context.read<UserNotifier>().fetchUserInfo(userNameController.text);

      // await context.read<UserNotifier>().fetReposInfo(userNameController.text);
      // Navigator.of(context).pushNamed(AppRoutes.userDetails);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://cdn2.iconfinder.com/data/icons/social-icons-33/128/Github-512.png',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: model.isLoading
                          ? MainAxisAlignment.spaceAround
                          : MainAxisAlignment.center,
                      children: [
                        Text('Get my Github Profile'),
                        model.isLoading
                            ? Container(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                ),
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                  ),
                  onPressed: getUserInfo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
