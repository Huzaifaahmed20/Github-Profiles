import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context, String title, String description) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () => Navigator.of(context).pop(),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(description),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
