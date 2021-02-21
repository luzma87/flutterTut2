import 'package:flutter/material.dart';
import 'package:tutorial2/injection/dependency_injection.dart';
import 'package:tutorial2/module/contacts/contact_list_view.dart';

void main() {
  Injector.configure(Flavor.PRO);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new ContactsPage());
  }
}
