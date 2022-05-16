import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:poc/app_router.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('uiop: $message');
  print("Handling a background message: ${message.messageId}");
}

class PushNotificationService {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Future<void> setupInteractedMessage() async {
    await Firebase.initializeApp();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('uiop: $message');
      print('uiop: ${message.data}');
      final index = message.data['id'] as String;
      appRouter.pushNamed('/books/$index');
    });
    // await enableIOSNotifications();
    await registerNotificationListeners();
  }

  static Future<void> registerNotificationListeners() async {
    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    // const iOSSettings = IOSInitializationSettings(
    //   requestSoundPermission: false,
    //   requestBadgePermission: false,
    //   requestAlertPermission: false,
    // );
    const initSettings = InitializationSettings(
      android: androidSettings,
      // iOS: iOSSettings,
    );
    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onSelectNotification: (message) async {
        print('uiop: $message');
      },
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      print('uiop: $message');
      final notification = message!.notification;
      final android = message.notification?.android;

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon,
              playSound: true,
            ),
          ),
        );
      }
      FirebaseMessaging.instance
          .getToken()
          .then((token) => print('uiop token: $token'));
    });
  }

  static Future<void> enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
