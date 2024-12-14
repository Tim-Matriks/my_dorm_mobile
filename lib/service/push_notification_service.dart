import 'dart:convert';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as serviceControl;

class PushNotificationService {
  static Future<String> getAccessToken() async {
    String? filePath = Platform.environment['GOOGLE_SERVICE_ACCOUNT_PATH'];
    if (filePath == null) {
      throw Exception(
          "Environment variable GOOGLE_SERVICE_ACCOUNT_PATH not found");
    }

    // Baca file dari path
    String jsonString = await File(filePath).readAsString();

    // Decode JSON string menjadi Map
    Map<String, dynamic> serviceAccountJson = jsonDecode(jsonString);

    List<String> scopes = [
      'https://www.googleapis.com/auth/firebase.messaging'
    ];

    http.Client client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    // get the access token
    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    client.close();

    return credentials.accessToken.data;
  }

  static sendNotificationToSelectedUser(String deviceToken,
      BuildContext context, String title, String desc) async {
    final String serverAccessTokenKey = await getAccessToken();
    String endpointFirebaseCloudMessaging =
        'https://fcm.googleapis.com/v1/projects/my-dorm-f2cad/messages:send';
    var uuid = Uuid();
    String tripID = uuid.v4();

    final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {'title': title, 'body': desc},
        'data': {
          'tripID': tripID,
        }
      }
    };

    final http.Response response = await http.post(
      Uri.parse(endpointFirebaseCloudMessaging),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverAccessTokenKey',
      },
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print("Notification sent successfully.");
    } else {
      print("Failed to send Notification: ${response.statusCode}");
    }
  }
}
