import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatelessWidget {
  final String url;
  final String judul;

  WebView({this.judul, this.url});

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      appBar: AppBar(
        title: Text(judul),
        backgroundColor: Colors.teal[900],
      ),
      withJavascript: true,
      withLocalStorage: true,
      withZoom: false,
      initialChild: Container(
        color: Colors.redAccent,
        child: Center(child: CircularProgressIndicator())
      ),
    );
  }
}