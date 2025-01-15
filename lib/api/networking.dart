import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/error.dart';

class Networking {
  final String urlSection;


  Networking({required this.urlSection});

  // Await the http get response, then decode the json-formatted response.
  Future getData(dynamic? headers) async {
    String baseURL = dotenv.env['API_BASE_URL'] ?? "";

    String url = baseURL + urlSection;

    print(url);

    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      print('Body: $response.body');
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future postData(dynamic body, dynamic? headers) async {
    String baseURL = dotenv.env['API_BASE_URL'] ?? "";

    String url = baseURL + urlSection;

    var response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return GenericAPIError(statusCode: response.statusCode);
    }
  }
}
