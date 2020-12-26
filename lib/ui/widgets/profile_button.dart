import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    Key key,
    @required this.isLoading,
    @required this.onPressed,
  }) : super(key: key);

  final bool isLoading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
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
