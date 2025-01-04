import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:googleapis/androidenterprise/v1.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class MyNotificationService {
  static Future<String> getAccessToken() async {
    try {
      // String contents =
      //     await rootBundle.loadString('assets/service_account.json');

      // Map<String, dynamic> serviceAccountJson = jsonDecode(contents);
      // print("serviceAccountJson: ${serviceAccountJson}");
      final serviceAccountJson = {
        "type": "service_account",
        "project_id": "my-dorm-f2cad",
        "private_key_id": "c55c5f14260dea2646d39595ee23dab9f1105783",
        "private_key":
            "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCqpH9clORCzoqd\nK/HkhUdkJ+SvVHrW7H44ioLIEIbn0yd5vluXCtyTo+ws0+pPC9r4DW1vENdu6ANY\nT6jUBPFA6dcM8CGjDvSQtBohaqA3jNhvWreO51dp5KmbHFrTWE76QF8drnPf042q\nVSdDGZKnfMzEf1dYiZe2BwFXcyTKCzCR/zIVe1evjen3oaTdoen9JyxOWVg0muz9\nx6ZOIqSjB6OYYmzEARTkCwhQUzc8m4OoYvYKeJp9MJRzqLW8Q7127ggnxB2UdVwP\nnPM/cWf1CASUkwWVfge0RyFFLCatTYxIQ0y5uXZIJ1/Ix0oWC8p7uJOLy6Cs4SKH\n+Mgehl2DAgMBAAECggEAA/3XENZWxI1KRsTpYpwPgHNCcSt7uB1OEoqC5qUkUrXo\nvXtLbywM3tM9ygqm93Riidzei3OMZoa81Ur/uv3mmssdgar4TnUiGWRtHAz/dG0x\n/uDTXF9i9xInOX6fTURKjKYG043qHfk33h0hzvsBKDPOImaMJ4EIcHSXfnEuEh/J\nGsIjy3NxxilpB/SkCYwCu7/+A3gRmGGbLXk91Pt86TnvDWJu4+7nKuJk12TqP4jh\n483C2ts8o9PfFbxOmP4yRTlpcczVPzsctjDeylbPjpCGk6rTw9SyKE85B9rHL99y\nw/f1uneHuJTnfMP3NiWUZZHdvs9OXX71WjAGrsiZMQKBgQDS8vrSkF7H5DtTeKR/\njsHqc4VdT0Qws97uEB/KArOSyiCx7A0uLQ/3Ijr+DwR53Pk0N6sKuvTpbMctShgI\nt5ZVuko04OVHweSR/DmLQMHfj4G9T3502bQudCJBEV+lx+IlHlYeGUAUQvHIXgKd\nf2WaRKIQcA+5j0Hb/6SliK502QKBgQDPFeALFwX65wM77MIIDZKiOoX11CbYRetU\nFNQ6xnRDqKrHtG8/3UfEyRELyx4JnTuJ8LF2pYAaF4HMbPb8n65c+qW3sAeS2QSx\nJKiLXMTs3RPdXToRCog478HK0HhVCQzHSDKzphvV5QrUbLJPDb/7QOWH1pcimSSP\npqh89dE7uwKBgBXtI50XXIKyemgmthJ8KDPSZh5YyuG1EIr2Khe5SCkN0XAs9QHD\ntVEewbr+nJx+F3kSADlRTXulzt4qQW1Gh93JS0VLywk2Yie6a9DJnl06cWXYCXDj\n4BKkB5tzztlQeXUaPiFKxppUiwUkoGj2gP0T/TRwMXI8LcBMRjTejCOhAoGBAKoG\n6vIQED/mRvh/tvwHsNp0NKMXcmFmXwalJ2+um60lojrgAeus0o1XDSDiv6HjMAxc\nzEh/MEO8Az2GRfA7Z10+Cqxb4owGlVygnaX3IFTeW74IGnH9dMVSzYmpSvN+v7gr\npj1saDRhn1e0e15/Cp7PtOWoImUs2iD8FCCtcAKbAoGAPNHf+V1xkT6HdDlpRM0h\n2vt3T3VplrTn6VjztloWNcsjTjPEF8/s1Qc7MrmBfPjaPhl+m1QA9yGi+ulQInW6\nHDKTjVuRiq7xw2npOp1MI+YaK+u6RapXeGXMWSOIvsm1jgn285caMHwjPrZxaeLI\nnLmHkUAeovahuyzANNsiedQ=\n-----END PRIVATE KEY-----\n",
        "client_email": "flutter-my-dorm@my-dorm-f2cad.iam.gserviceaccount.com",
        "client_id": "106715517679928174081",
        "auth_uri": "https://accounts.google.com/o/oauth2/auth",
        "token_uri": "https://oauth2.googleapis.com/token",
        "auth_provider_x509_cert_url":
            "https://www.googleapis.com/oauth2/v1/certs",
        "client_x509_cert_url":
            "https://www.googleapis.com/robot/v1/metadata/x509/flutter-my-dorm%40my-dorm-f2cad.iam.gserviceaccount.com",
        "universe_domain": "googleapis.com"
      };

      List<String> scopes = [
        'https://www.googleapis.com/auth/firebase.messaging'
      ];

      http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
      );

      // Get the access token
      auth.AccessCredentials credentials =
          await auth.obtainAccessCredentialsViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
        client,
      );

      client.close();

      return credentials.accessToken.data;
    } catch (e) {
      print("Error getting access token: $e");
      rethrow;
    }
  }

  // Send notification to the selected user
  static Future<void> sendNotificationToSelectedUser(String deviceToken,
      BuildContext context, String title, String desc) async {
    try {
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
    } catch (e) {
      print("Error sending notification: $e");
    }
  }
}
