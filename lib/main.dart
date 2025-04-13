import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_dorm/models/data_model.dart';
import 'package:my_dorm/screens/admin/home_admin.dart';
import 'package:my_dorm/screens/auth/login_page.dart';
import 'package:my_dorm/screens/dormitizen/home_dormitizen.dart';
import 'package:my_dorm/service/camera_service.dart';
import 'package:my_dorm/service/http_service.dart';
import 'package:my_dorm/service/myfirebasenotification_service.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'service/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  tz.initializeTimeZones();
  final cameraService = CameraService();
  await cameraService.initializeCameras();
  final NotificationService notificationService = NotificationService();
  await notificationService.initialize();
  DateTime selectedTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    21,
    45,
    0,
  );
  await notificationService.scheduleNotification(selectedTime);
  // _notificationService.showInstantNotification();
  await FirebaseNotificationService.initialize();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late String? role = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() async {
    role = await getRole();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider<DataModel>(
      create: (_) => DataModel(),
      child: MaterialApp(
          theme: ThemeData(fontFamily: "Sans", primarySwatch: Colors.red),
          home: (role == 'dormitizen')
              ? HomeDormitizen()
              : (role == 'senior_resident')
                  ? HomeAdmin()
                  : const LoginPage()),
    );
  }
}
