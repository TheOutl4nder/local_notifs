import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_notifs_o2021/books.dart';
import 'package:push_notifs_o2021/main.dart';
import 'package:push_notifs_o2021/utils/notification_util.dart';

import 'notif_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    AwesomeNotifications().requestPermissionToSendNotifications().then((isAllowed){
      if(isAllowed){
        AwesomeNotifications().displayedStream.listen((notificationMsg) {
          print(notificationMsg);
        });
        AwesomeNotifications().actionStream.listen((notificationAction) {
          if(!StringUtils.isNullOrEmpty(notificationAction.buttonKeyInput)){
            print(notificationAction);
          }
          else{
            processDefaultActionRecieved(notificationAction);
          }
        });
      }
    });

    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if(notification!=null && android !=null){
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title, 
          notification.body, 
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              color: Colors.blue,
              playSound: true,
            )
          ));
      }
    });

    getToken();
  }
  
  void processDefaultActionRecieved(ReceivedAction action){
    print("Accion recibida >>>>>>>>>>>>>> $action");
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Books(datos: action.title,)));
  }

  void getToken()async{
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: CircleAvatar(
              maxRadius: 120,
              backgroundColor: Colors.black87,
              child: Image.asset(
                "assets/books.png",
                height: 120,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: NotifMenu(
              notifSimple: () => showBasicNotification(123),
              notifConIcono: () => showLargeIconNotification(321),
              notifConImagen: () => showBigPictureAndLargeIconNotification(7410),
              notifConAccion: () => showBigPictureAndActionButtonsAndReplay(789),
              notifAgendada: () => repeatMinuteNotifications(159),
              cancelNotifAgendada: () => cancelAllSchedules(),
            ),
          ),
        ],
      ),
    );
  }
}
