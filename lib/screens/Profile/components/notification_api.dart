// // import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationApi {
//   static final _notifications = FlutterLocalNotificationsPlugin();
//
//   static Future _notificationDetails() async {
//     return const NotificationDetails(
//       android: AndroidNotificationDetails(
//         'channel name',
//         'channel description',
//         importance: Importance.max,
//       ),
//       iOS: IOSNotificationDetails(),
//     );
//   }
//
//   static Future showNotification ({
//     int id = 0,
//     required String title,
//     required String body,
//     required String payload,
//   }) async =>
//       _notifications.show(
//         id,
//         title,
//         body,
//         await _notificationDetails(),
//         payload: payload,
//       );
// }