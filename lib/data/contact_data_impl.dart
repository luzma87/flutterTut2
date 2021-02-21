import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'contact_data.dart';

class RandomUserRepository implements ContactRepository {
  static const _kRandomUserUrl = 'https://api.randomuser.me/?results=15';
  final JsonDecoder _decoder = new JsonDecoder();

  Future<List<Contact>> fetch() async {
    final response = await http.get(_kRandomUserUrl);
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw new FetchDataException(
          "Error while getting contacts [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
    }

    final contactsContainer = _decoder.convert(jsonBody);
    final List contactItems = contactsContainer['results'];
    print("---------------------------");
    print(contactItems[0]);
    print(contactItems[0]['location']);
    print(contactItems[0]['location']['street']);
    print(contactItems[0]['location']['city']);
    print("---------------------------");

    return contactItems
        .map((contactRaw) => Contact.fromMap(contactRaw))
        .toList();
  }
}
