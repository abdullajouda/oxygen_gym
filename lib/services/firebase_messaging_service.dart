// import 'dart:convert';
// import 'dart:io';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sixty_seconds/app_shared.dart';
//
// import 'local_notifications_service.dart';
//
// class LocalNotification {
//   final String type;
//   final Map data;
//
//   LocalNotification(this.type, this.data);
// }
//
// class NotificationsBloc {
//   NotificationsBloc._internal();
//
//   static final NotificationsBloc instance = NotificationsBloc._internal();
//
//   final BehaviorSubject<LocalNotification> _notificationsStreamController =
//   BehaviorSubject<LocalNotification>();
//
//   Stream<LocalNotification> get notificationsStream {
//     return _notificationsStreamController;
//   }
//
//   void newNotification(LocalNotification notification) {
//     _notificationsStreamController.sink.add(notification);
//   }
//
//   void dispose() {
//     _notificationsStreamController?.close();
//   }
// }
//
// class FirebaseMessagingService {
//   static FirebaseMessagingService _instance;
//   FirebaseMessaging _fcm;
//   // LocalNotificationsService _localNotificationsService;
//
//   FirebaseMessagingService._() {
//     _fcm = FirebaseMessaging();
//     // _localNotificationsService = LocalNotificationsService.instance;
//   }
//
//   FirebaseMessagingService(this._fcm);
//
//   // ||.. singleton pattern ..||
//   static FirebaseMessagingService get instance {
//     if (_instance != null) return _instance;
//     return _instance = FirebaseMessagingService._();
//   }
//
//   Future<String> getToken() async {
//     return _fcm.getToken();
//   }
//
//   Future<void> _onMessage(Map<String, dynamic> message) async {
//     // print("onMessage $message");
//     //   showGeneralDialog(
//     //     barrierLabel: message['notification']['title'],
//     //     barrierDismissible: true,
//     //     barrierColor: Colors.black.withOpacity(0.1),
//     //     transitionDuration: Duration(milliseconds: 200),
//     //     context: AppShared.navKey.currentContext,
//     //     pageBuilder: (context, anim1, anim2) {
//     //       return Align(
//     //         alignment: Alignment.topCenter,
//     //         child: Material(
//     //           color: Colors.transparent,
//     //           child: Padding(
//     //             padding:
//     //             const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//     //             child: Stack(
//     //               children: [
//     //                 NotificationCard(
//     //                   notifications: NotificationModel(
//     //                       title: message['notification']['title'],
//     //                       message: message['notification']['body']),
//     //                 ),
//     //                 Positioned(
//     //                   top: 15,
//     //                   right: 15,
//     //                   child: IconButton(
//     //                     icon: Icon(Icons.clear),
//     //                     onPressed: () => Navigator.pop(context),
//     //                   ),
//     //                 )
//     //               ],
//     //             ),
//     //           ),
//     //         ),
//     //       );
//     //     },
//     //     transitionBuilder: (context, anim1, anim2, child) {
//     //       return SlideTransition(
//     //         position:
//     //         Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(anim1),
//     //         child: child,
//     //       );
//     //     },
//     //   );
//     if (message['notification'] != null) {
//       final notification =
//       LocalNotification("notification", message['notification'] as Map);
//       NotificationsBloc.instance.newNotification(notification);
//
//       if (AppShared.notification['notification'] == null) {
//         localNotificationsService.showNotification(
//           message['title'],
//           message['body'],
//           payload: jsonEncode(AppShared.notification),
//         );
//       } else {
//         if ((AppShared.notification['notification'] as Map).isEmpty)
//           localNotificationsService.showNotification(
//             message['title'],
//             message['body'],
//           );
//         else
//           localNotificationsService.showNotification(
//             message['notification']['title'],
//             message['notification']['body'],
//             payload: jsonEncode(AppShared.notification),
//           );
//       }
//       return null;
//     }
//     if (message['data'] != null) {
//       final notification = LocalNotification("data", message['data'] as Map);
//       NotificationsBloc.instance.newNotification(notification);
//       if (AppShared.notification['notification'] == null) {
//         localNotificationsService.showNotification(
//           message['title'],
//           message['body'],
//           payload: jsonEncode(AppShared.notification),
//         );
//       } else {
//         if ((AppShared.notification['notification'] as Map).isEmpty)
//           localNotificationsService.showNotification(
//             message['title'],
//             message['body'],
//           );
//         else
//           localNotificationsService.showNotification(
//             message['notification']['title'],
//             message['notification']['body'],
//             payload: jsonEncode(AppShared.notification),
//           );
//       }
//       return null;
//     }
//   }
//
//   Future initialise() async {
//     if (Platform.isIOS) {
//       _fcm.requestNotificationPermissions(
//           IosNotificationSettings(sound: true, badge: true, alert: true));
//     }
//     String token = await _fcm.getToken();
//     print("FirebaseMessaging token: $token");
//
//     _fcm.configure(
//       onMessage: _onMessage,
//       onLaunch: (Map<String, dynamic> message) async {
//         print("onLaunch: $message");
//         AppShared.notification = message;
//       },
//       onResume: (Map<String, dynamic> message) async {
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         print("onResume: $message");
//         try {
//           AppShared.notification = message;
//           String token = prefs.getString('userToken');
//           // if (token != null) {
//           //   if (AppShared.notification != null) {
//           //     String msgType;
//           //     if (AppShared.notification['data'] == null) {
//           //       msgType = AppShared.notification['msgType'];
//           //     } else {
//           //       msgType = AppShared.notification['data']['msgType'];
//           //
//           //       AppShared.notification = null;
//           //     }
//           //   } else {
//           //     if (prefs.getString('userType') == 'provider') {
//           //     }
//           //   }
//           // }
//           AppShared.notification = null;
//         } catch (error) {
//           print(error.toString());
//         }
//       },
//     );
//   }
//
// //   Future<void> init() async {
// //     _fcm.requestNotificationPermissions(IosNotificationSettings(sound: true,
// //         badge: true,
// //         alert: true));
// // //    _fcm.subscribeToTopic('');
// //     _fcm.configure(
// //
// //
// //
// //     );
// //   }
// }
