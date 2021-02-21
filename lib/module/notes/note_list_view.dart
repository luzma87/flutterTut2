import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tutorial2/widget/drawer.dart';

class NotesPage extends StatelessWidget {
  static const String routeName = '/notes';

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

    return Scaffold(
        appBar: AppBar(
          title: Text("Notes"),
        ),
        drawer: AppDrawer(),
        body: RichText(
          text: TextSpan(
            text: 'Hello ',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
            children: <TextSpan>[
              TextSpan(
                  text: 'world!',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(
                  text: ' click here!',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _showMyDialog("title uno", "content uno")),
              TextSpan(
                  text: ' click here again!',
                  style: TextStyle(
                      color: Colors.pink,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => _showMyDialog("title dos", "content dos")),
            ],
          ),
        ));
  }
}
