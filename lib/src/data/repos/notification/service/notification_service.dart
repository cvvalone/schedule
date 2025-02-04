import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:schedule/src/features/notification/widget/notification_screen.dart';

class NotificationService {
  NotificationService._privConstructor();
  static final NotificationService _instance =
      NotificationService._privConstructor();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotification =
      FlutterLocalNotificationsPlugin();
  bool _isInitialized = false;

  static NotificationService get instance => _instance;

  Future<void> initPermissions(
      {required String topic, required BuildContext context}) async {
    if (_isInitialized) {
      print('Notifications вже ініціалізовано');
      return;
    }
    _isInitialized = true;

    await _initLocalNotifications();

    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Дозвіл на відображення push-сповіщень отримано!');
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      print('Користувач заборонив надсилання сповіщень!');
      _isInitialized = false;
      return;
    }

    String? token = await _fcm.getToken();
    print('User token: $token');

    await _fcm.subscribeToTopic(topic);
    print('Підписано на topic: $topic');

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        print("Повідомлення у foreground: ${message.notification?.title}");

        // Кастомне сповіщення через ScaffoldMessenger
        if (message.notification != null) {
          _showLocalNotification(
              message.notification!.title ?? "Нове сповіщення",
              message.notification!.body ?? "");
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        print(
            "Повідомлення відкрите через клік: ${message.notification?.title}");
        Navigator.pushNamed(context, '/notifications');       
      },
    );
  }

  Future<void> _initLocalNotifications() async {
    const AndroidInitializationSettings androidInit =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings iosInit = DarwinInitializationSettings();

    final InitializationSettings initSettings =
        InitializationSettings(android: androidInit, iOS: iosInit);

    await _localNotification.initialize(initSettings);
  }

  Future<void> _showLocalNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'channel_id',
      'Основний канал',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _localNotification.show(0, title, body, notificationDetails);
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _fcm.unsubscribeFromTopic(topic);
    print("Відписано від topic '$topic'");
  }
}
