import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static final String baseUrl = "https://api.giphy.com/v1/gifs/trending?api_key=nNLNjq2xRyv3C0KZ18gNK6xyYHpT4PKI&limit=12";

  static Future<Map<String, dynamic>> get() async {
    final response = await http.get(Uri.parse(baseUrl));
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      print("processResponse success");
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return {"error": true};
    }
  }

  static void debugPrint(String value) {
    print("[BASE_NETWORK] - $value");
  }
}