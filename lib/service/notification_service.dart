import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );
  }

  Future<void> _onNotificationTap(NotificationResponse response) async {
    dev.log("notification clicked: ${response.payload}");
    print('notif recieved!');
  }

  Future<void> showInstantNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifies =
        AndroidNotificationDetails(
      'instant_channel',
      'Instant Notifications',
      channelDescription: 'Channel for instant notification',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifies =
        NotificationDetails(android: androidPlatformChannelSpecifies);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Instant Notifications',
      'Description of Notification',
      platformChannelSpecifies,
      payload: 'instant',
    );
  }

  Future<void> scheduleNotification(DateTime scheduledDateTime) async {
    try {
      if (scheduledDateTime.isBefore(DateTime.now())) {
        dev.log(
            'notification scheduled for tomorrow at ${scheduledDateTime.hour}:${scheduledDateTime.minute}');
        scheduledDateTime = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day + 1,
          07,
          23,
          0,
        );
      } else {
        dev.log(
            'Notification has scheduled for ${scheduledDateTime.hour} : ${scheduledDateTime.minute}');
        print('coba');
      }

      const AndroidNotificationDetails androidPlatformChannelSpecifies =
          AndroidNotificationDetails(
        'instant_channel',
        'Instant Notifications',
        channelDescription: 'Channel for instant notification',
        importance: Importance.max,
        priority: Priority.high,
      );

      const NotificationDetails platformChannelSpecifies =
          NotificationDetails(android: androidPlatformChannelSpecifies);
      await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        'Peringatan Jam Malam',
        'Halo dormitizen! 15 menit lagi gedung asrama akan ditutup, segera balik ke asrama sebelum jam 10 malam ya',
        tz.TZDateTime.from(scheduledDateTime, tz.local),
        platformChannelSpecifies,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'instant',
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      );
    } catch (e) {
      dev.log('error catched: $e');
    }
  }

  Future<void> saveNotifications(
      List<Map<String, String>> notifications) async {
    final prefs = await SharedPreferences.getInstance();
    // Konversi list ke JSON string
    String jsonString = jsonEncode(notifications);
    await prefs.setString('notifications', jsonString);
  }

  Future<List<Map<String, String>>> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString('notifications');

    if (jsonString != null) {
      // Konversi JSON string kembali ke list
      List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((item) => Map<String, String>.from(item)).toList();
    }
    return [];
  }
}
