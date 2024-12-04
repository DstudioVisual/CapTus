import 'dart:async';
import 'dart:io';
import 'package:CapTus/functions/edit/edit_page.dart';
import 'package:CapTus/functions/home/home_page.dart';
import 'package:CapTus/functions/login/login_page.dart';
import 'package:CapTus/functions/policies.dart';
import 'package:CapTus/functions/principals/principals_page.dart';
import 'package:CapTus/functions/register/register_page.dart';

import 'package:CapTus/functions/splash/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Solicitar permisos de notificación para iOS
  NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('El usuario otorgó permiso');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('El usuario otorgó permiso provisional');
  } else {
    print('El usuario rechazó o no aceptó el permiso');
  }

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  runApp(MyApp(
    messaging: messaging,
  ));
}

class MyApp extends StatefulWidget {
  final FirebaseMessaging messaging;

  MyApp({required this.messaging});

  @override
  _MyAppState createState() => _MyAppState();
}

String tokenGlobal = '';

class _MyAppState extends State<MyApp> {
  late GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    configureFirebaseMessaging(); // Llama a esta función aquí
  }

  Future<void> configureFirebaseMessaging() async {
    FirebaseMessaging messaging = widget.messaging;
    if (Platform.isIOS) {
      String? apnsToken = await messaging.getAPNSToken();
      print(apnsToken);
    } else {
      messaging.getToken().then((token) {
        print("FirebaseMessaging token: $token");
        tokenGlobal = token ?? '';
      });
    }

    messaging
        .requestPermission(sound: true, badge: true, alert: true)
        .then((value) {
      print("FirebaseMessaging permission granted: $value");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      print('Message data: ${message.data}');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CapTus",
      navigatorKey: navigatorKey,
      initialRoute: "splash",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.blue,
          centerTitle: true,
          elevation: 0,
        ),
        primaryColor: Colors.black,
      ),
      routes: {
        'politicas': (BuildContext context) => Policies(),
        'splash': (BuildContext context) => SplashPage(),
        'home': (BuildContext context) => HomePage(),
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'edit': (BuildContext context) => EditPage(),
        'principals': (BuildContext context) => PrincipalsPage(),
      },
    );
  }
}
