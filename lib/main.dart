import 'package:flutter/material.dart';
import 'package:tutorial2/module/steps/steps_list_view.dart';
import 'package:tutorial2/routes/Routes.dart';
import 'module/contacts/contact_list_view.dart';
import 'injection/dependency_injection.dart';
import 'module/events/event_list_view.dart';
import 'module/notes/note_list_view.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
// TODO: uncomment the line below after codegen
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  Injector.configure(Flavor.PRO);

  runApp(new MaterialApp(
    localizationsDelegates: [
      // ... app-specific localization delegate[s] here
      // TODO: uncomment the line below after codegen
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('en', ''),
      const Locale('es', ''),
    ],
    onGenerateTitle: (BuildContext context) =>
        AppLocalizations.of(context).appTitle,
    title: 'Flutter Demo',
    theme: new ThemeData(primarySwatch: Colors.indigo),
    home: ContactsPage(),
    routes: {
      Routes.contacts: (context) => ContactsPage(),
      Routes.events: (context) => EventsPage(),
      Routes.notes: (context) => NotesPage(),
      Routes.steps: (context) => StepsPage(),
    },
  ));
}
