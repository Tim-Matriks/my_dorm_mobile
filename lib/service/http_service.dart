import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String apiURL = "https://mydorm-mobile-backend-production.up.railway.app";

Future<Map<String, dynamic>> fetchLaporan(String token) async {
  final uri = Uri.parse("$apiURL/laporan");
  final response = await http.get(
    uri,
    headers: <String, String>{
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print('Failed to load user details. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Exception('Failed to load user details');
  }
}

Future<Map<String, dynamic>> getDataToken(String address, String token) async {
  final uri = Uri.parse(apiURL + address);
  final response = await http.get(
    uri,
    headers: <String, String>{
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print('Failed to load user details. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Exception('Failed to load user details');
  }
}

Future<Map<String, dynamic>> logout(String token) async {
  final uri = Uri.parse("$apiURL/logout");
  final response = await http.get(
    uri,
    headers: <String, String>{
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print('Failed to load user details. Status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Exception('Failed to load user details');
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

Future<Map<String, dynamic>> postDataToken(
    String address, Map<String, dynamic> body, String token) async {
  final uri = Uri.parse(apiURL + address);
  final response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
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

Future<void> saveToken(String token, String role) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('accessToken', token);
  await prefs.setString('role', role);
}

Future<void> removeToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('accessToken');
  await prefs.remove('role');
}

Future<String?> getRole() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('role');
}
