import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:github_profiles/app/data/models/repos_info.dart';
import 'package:github_profiles/app/data/models/user_info.dart';
import 'package:github_profiles/providers/repos_provider.dart';
import 'package:github_profiles/providers/user_provider.dart';
import 'package:hooks_riverpod/all.dart';

class CustomButton extends HookWidget {
  CustomButton({
    Key key,
    @required this.userNameController,
    @required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final TextEditingController userNameController;
  @override
  Widget build(BuildContext context) {
    final repoControllerState = useProvider(repoControllerProvider.state);
    final userControllerState = useProvider(userControllerProvider.state);

    final isLoading = userControllerState is AsyncLoading ||
        repoControllerState is AsyncLoading;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: isLoading
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.center,
            children: [
              Text('Get my Github Profile'),
              isLoading
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
        onPressed: onPressed,
      ),
    );
  }
}
