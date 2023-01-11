import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pankaj_charitable_trust/models/recipients/recipients_model.dart';

const String recipBaseUrl =
    "https://pankajtrust.cyberfort.co.in/api/success/list";

List<Datum>? recipientData = [];

class BaseClient {
  var client = http.Client();

  Future<dynamic> getRecipient() async {
    try {
      var url = Uri.parse(recipBaseUrl);

      var response =
          await client.get(url, headers: {"Content-Type": "application/json"});

      var recipient = recipientFromJson(response.body);

      recipientData = recipient.data;

      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (err) {
      return print(err);
    }
  }

  Future<dynamic> postRecipient(dynamic object) async {
    try {
      var url = Uri.parse(recipBaseUrl);
      var _payload = json.encode(object);

      var response = await client.post(url,
          body: _payload, headers: {"Content-Type": "application/json"});

      print(_payload);

      if (response.statusCode == 201) {
        return response.body;
      }
    } catch (err) {
      return print(err);
    }
  }

  Future<dynamic> put(int id, dynamic object) async {
    try {
      var url = Uri.parse("$recipBaseUrl/?Id=$id");
      var _payload = json.encode(object);

      var response = await client.put(url,
          body: _payload, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        return response.body;
      } else {}
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<dynamic> delete(int id) async {
    try {
      var url = Uri.parse("$recipBaseUrl/?Id=$id");

      print(url);

      var response = await client
          .delete(url, headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        return response.body;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
