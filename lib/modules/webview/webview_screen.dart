import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen(this.url,this.title, {Key? key}) : super(key: key);

  final String url;
  final String title;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$title'),),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
