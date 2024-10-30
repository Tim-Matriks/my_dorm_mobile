import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_dorm/models/data_model.dart';
import 'package:my_dorm/screens/auth/login_page.dart';
import 'package:provider/provider.dart';
import 'service/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyNotificationService myNotif = MyNotificationService();
  await myNotif.initialization();
  // int countDown = 22 - DateTime.now().hour;
  // DateTime selectedTime = DateTime.now().add(Duration(hours: countDown));
  DateTime selectedTime = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
    21,
    50,
    0,
  );
  myNotif.scheduleDailyNotification(selectedTime);
  // myNotif.showNotification();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
          home: const LoginPage()),
    );
  }
}
