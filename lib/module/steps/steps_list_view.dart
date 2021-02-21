import 'package:flutter/material.dart';
import 'package:tutorial2/widget/drawer.dart';

class StepsPage extends StatelessWidget {
  static const String routeName = '/steps';

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog(title, content) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text(content),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return new Scaffold(
        appBar: AppBar(
          title: Text("Events"),
        ),
        drawer: AppDrawer(),
        body: ButtonBar(
          children: [
            ElevatedButton(
                child: Text("uno"),
                onPressed: () {
                  _showMyDialog("title uno", "uno");
                }),
            ElevatedButton(
                child: Text("dos"),
                onPressed: () {
                  _showMyDialog("title dos", "dos");
                }),
            ElevatedButton(
                child: Text("tres"),
                onPressed: () {
                  _showMyDialog("title tres", "tres");
                }),
          ],
        ));
  }
}
