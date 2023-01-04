import 'package:http/http.dart' as http;
import 'package:pankaj_charitable_trust/models/recipients/recipients_model.dart';

const String recipBaseUrl =
    "https://pankajtrust.cyberfort.co.in/recipients/list";

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
}
