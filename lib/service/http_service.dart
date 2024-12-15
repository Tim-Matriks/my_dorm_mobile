import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String apiURL =
    "https://mydorm-mobile-backend-production.up.railway.app/";
String token = "";

Future<void> fetchData(String address) async {
  final response = await http.get(Uri.parse(apiURL + address));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    print(data);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<Map<String, dynamic>> postData(
    String address, Map<String, dynamic> body) async {
  final uri = Uri.parse(apiURL + address);
  final response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(body),
  );

  if (response.statusCode == 200 || response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    print('Failed to post data. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    return jsonDecode(response.body);
  }
}

Future<String?> getToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('accessToken');
}

Future<void> saveToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('accessToken', token);
}
