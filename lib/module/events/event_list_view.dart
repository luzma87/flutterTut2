import 'package:flutter/material.dart';
import 'package:tutorial2/widget/drawer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventsPage extends StatelessWidget {
  static const String routeName = '/events';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Events"),
        ),
        drawer: AppDrawer(),
        body: WebView(initialUrl: 'https://flutter.io'));
  }
}
