import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:push_notifs_o2021/home/home_page.dart';

import 'utils/constants_utils.dart';

void main() async {
  await initLocalNotifications();
  runApp(MyApp());
}

Future initLocalNotifications() async {
  // TODO: inicializar los canales
  await AwesomeNotifications().initialize(null,[
    NotificationChannel(
      channelKey: channelSimpleId, 
      channelName: channelSimpleName, 
      channelDescription: channelSimpleDescr,
      defaultColor: Colors.purple,
      ledColor: Colors.blue,
      importance: NotificationImportance.Default),

      NotificationChannel(
      channelKey: channelBigPictureId, 
      channelName: channelBigPictureName, 
      channelDescription: channelBigPictureDescr,
      defaultColor: Colors.purple,
      ledColor: Colors.yellow,
      importance: NotificationImportance.High),

      NotificationChannel(
      channelKey: channelScheduleId, 
      channelName: channelScheduleName, 
      channelDescription: channelScheduleDescr,
      defaultColor: Colors.purple,
      ledColor: Colors.red,
      importance: NotificationImportance.Default)
  ]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: ColorScheme(
          primary: Colors.indigo,
          primaryVariant: Colors.indigoAccent,
          secondary: Colors.green,
          secondaryVariant: Colors.lime,
          surface: Colors.grey[200]!,
          background: Colors.grey[200]!,
          // background: Colors.deepPurple[100]!,
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.grey,
          onBackground: Colors.deepPurple[100]!,
          onError: Colors.red,
          brightness: Brightness.light,
        ),
      ),
      home: HomePage(),
    );
  }
}
