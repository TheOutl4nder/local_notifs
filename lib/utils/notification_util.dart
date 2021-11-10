import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:push_notifs_o2021/utils/constants_utils.dart';

/// Notificacion basica solo texto
/// El channel debe ser igual al de la inicializacion
Future<void> showBasicNotification(int id) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelSimpleId,
      title: simpleTitle,
      body: simpleDescr,
    ),
  );
}

/// Notificacion basica con icono a la derecha
/// payload es datos que pudieramos utilizar para algo
/// El channel debe ser igual al de la inicializacion
Future<void> showLargeIconNotification(int id) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelBigPictureId,
      title: bigPictureTitle,
      body: bigPictureDescr,
      largeIcon: iconExample,
      notificationLayout: NotificationLayout.BigPicture,
      payload: {'token': 'jakbnuadbucbcuckaffa5a451',
                'idUser':'45415451c22c1'},
    ),
  );
}

Future<void> showBigPictureAndLargeIconNotification(int id) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelBigPictureId,
      title: bigPictureTitle,
      body: bigPictureDescr,
      bigPicture: pictureExample,
      largeIcon: iconExample,
      notificationLayout: NotificationLayout.BigPicture,
      payload: {'token': 'jakbnuadbucbcuckaffa5a451',
                'idUser':'45415451c22c1'},
    ),
  );
}

Future<void> showBigPictureAndActionButtonsAndReplay(int id) async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelBigPictureId,
      title: bigPictureTitle,
      body: bigPictureDescr,
      bigPicture: pictureExample,
      largeIcon: iconExample,
      notificationLayout: NotificationLayout.BigPicture,
      payload: {'token': 'notificacion con acciones',
                'idUser':'45415451c22c1'},
    ),
    actionButtons: [
      NotificationActionButton(key: actionOneKey, label: actionOneTitle,
      buttonType: ActionButtonType.InputField),
      NotificationActionButton(key: actionTwoKey, label: actionTwoTitle,
      buttonType: ActionButtonType.Default)
    ]
  );
}

Future<void> repeatMinuteNotifications(int id) async {
  String localTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: id,
      channelKey: channelScheduleId,
      title: scheduledTitle,
      body: scheduledTitle,
    ),
    schedule: NotificationInterval(interval: 60, timeZone: localTimeZone, repeats: true)
  );
}

Future<void> cancelAllSchedules()async{
  await AwesomeNotifications().cancelAllSchedules();
}