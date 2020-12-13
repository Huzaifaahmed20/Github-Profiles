import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReposWebView extends StatefulWidget {
  @override
  ReposWebViewState createState() => ReposWebViewState();
}

class ReposWebViewState extends State<ReposWebView> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final reposUrl = ModalRoute.of(context).settings.arguments;

    return WebView(
      initialUrl: reposUrl,
    );
  }
}
