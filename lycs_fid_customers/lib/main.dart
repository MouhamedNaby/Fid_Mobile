import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lycs_fid_customers/views/my_home_page.dart';
import 'package:lycs_fid_customers/controllers/user.dart';
import 'package:lycs_fid_customers/database/databasehelper.dart';
import 'package:provider/provider.dart';
// core FlutterFire dependency
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final messaging = FirebaseMessaging.instance;

  final settings = await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  String? token = await messaging.getToken();

  if (kDebugMode) {
    print('Permission granted: ${settings.authorizationStatus}');
  }

  print('Print le token est : $token');

  FirebaseMessaging.onMessage.listen((message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification!.android;
    print('New FCM onMessage message : ${message.toString()} \n\n');
    print('New FCM onMessage message id: ${message.messageId}');
    print('New FCM onMessage message sentTime: ${message.sentTime}');
    print(
        'New FCM onMessage message notification title: ${message.notification!.title}');
    print(
        'New FCM onMessage message notification body: ${message.notification!.body}');
    // BlocProvider.of(context).add(SaveNotification(notification: notification));
  });
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    print('New FCM onMessageOpenedApp message : ${message.toString()} \n\n');
    print('New FCM onMessageOpenedApp message id: ${message.messageId}');
    print('New FCM onMessageOpenedApp message sentTime: ${message.sentTime}');
    print(
        'New FCM onMessageOpenedApp message notification title: ${message.notification!.title}');
    print(
        'New FCM onMessageOpenedApp message notification body: ${message.notification!.body}');
  });

  await DatabaseHelper.getDB();

  runApp(ChangeNotifierProvider(
      create: (context) => UserController(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
