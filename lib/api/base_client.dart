import 'package:http/http.dart' as http;

const String recipBaseUrl =
    "https://pankajtrust.cyberfort.co.in/api/success/single";

class BaseClient {
  var client = http.Client();

  Future<dynamic> getRecipient() async {
    var url = Uri.parse(recipBaseUrl);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return Exception(response.reasonPhrase).toString();
    }
  }
}
