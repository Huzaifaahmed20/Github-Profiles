import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_profiles/state_provider/repos_provider.dart';
import 'package:github_profiles/state_provider/user_provider.dart';
import 'package:github_profiles/ui/widgets/widgets.dart';
import 'package:hooks_riverpod/all.dart';

class HomePage extends HookWidget {
  void getProfile(
      BuildContext context, TextEditingController userNameController) async {
    if (userNameController.text.isEmpty) return;

    await context
        .read(userControllerProvider)
        .fetchUserInfo(userNameController.text);
    await context
        .read(repoControllerProvider)
        .fetReposInfo(userNameController.text);
  }

  @override
  Widget build(BuildContext context) {
    final userNameController = useTextEditingController();

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
              CustomButton(
                userNameController: userNameController,
                onPressed: () => getProfile(context, userNameController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
