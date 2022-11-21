import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fyp_frontend/screens/barcodeScan/barcode_scan_screen.dart';
import 'package:fyp_frontend/screens/chatbot/chatbot_screen.dart';
import 'package:fyp_frontend/screens/map/nearby_screen.dart';
import 'package:fyp_frontend/screens/register/login_screen.dart';
import 'package:fyp_frontend/services/api_service.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/screens/home/home_screen.dart';
import 'package:fyp_frontend/screens/profile/profile_screen.dart';
import 'package:fyp_frontend/screens/register/register_screen.dart';
import 'package:fyp_frontend/screens/wishlist/wishlist_screen.dart';
import 'package:fyp_frontend/services/shared_service.dart';
import 'package:fyp_frontend/utils/shared_preferences.dart';

import 'config.dart';
import 'screens/notifications/notification_screen.dart';

Widget _defaultHome = const LoginScreen();

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel', // id
//   'High Importance Notifications', // title
//   description:
//       'This channel is used for important notifications.', // description
//   importance: Importance.high,
//   playSound: true,
// );

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("_firebaseMessagingBackgroundHandler: $message");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool result = await SharedService.isLoggedIn();

  if (result) {
    _defaultHome = const MainScreen();
  }
  await UserSharedPreferences.init();
  await Firebase.initializeApp();

  FirebaseMessaging.instance.getToken().then((value) {
    APIService.updateUserToken(value).then((response) {
      if (response!) {
        print("Token updated");
      } else {
        print("Token update failed");
      }
    });

    print("Token : $value");
  });

  /// If Application is on Background
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    print('A new onMessageOpenedApp event was published!');
    print("Message : $message");
    Navigator.pushNamed(navigatorKey.currentState!.context, 'notification',
        arguments: {
          "message": json.encode(message.data),
        });
  });

  /// If Application is on Closed or Killed
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null) {
      print("Message : $message");
      Navigator.pushNamed(navigatorKey.currentState!.context, 'notification',
          arguments: {
            "message": json.encode(message.data),
          });
    }
  });

  /// When app is in background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );

  Stripe.publishableKey =
      "pk_test_51LjdB8CiUE6D0lAimWfiJGqo5DNJ5vXASyY3b5ywS6qrhPAuIbXgtmTc1JJPY15TRx0pW3sn3mWpcH8s1Wb1Ai5w003Ftn0omd";

  await Stripe.instance.applySettings();

  runApp(const ProviderScope(
    child: GetMaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    // Foreground notification
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     flutterLocalNotificationsPlugin.show(
    //       notification.hashCode,
    //       notification.title,
    //       notification.body,
    //       NotificationDetails(
    //         android: AndroidNotificationDetails(
    //           channel.id,
    //           channel.name,
    //           channelDescription: channel.description,
    //           color: Colors.blue,
    //           playSound: true,
    //           //icon: 'app_icon',
    //         ),
    //       ),
    //     );
    //   }
    // });

    // Open App on Click
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print("A new Message was published");
    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;
    //   if (notification != null && android != null) {
    //     showDialog(
    //         context: context,
    //         builder: (_) {
    //           return AlertDialog(
    //             title: Text(notification.title!),
    //             content: SingleChildScrollView(
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(notification.body!),
    //                 ],
    //               ),
    //             ),
    //           );
    //         });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Fast Mart',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        primarySwatch: Colors.blue,
        fontFamily: "Gordita",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      routes: {
        '/': (context) => _defaultHome,
        'login': (context) => const LoginScreen(),
        'register': (context) => const RegisterScreen(),
        'home': (context) => const MainScreen(),
        'notification': (context) => const NotificationScreen(),
      },
      // home: const RegisterScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  //In App Notification
  // showNotification() {
  //   setState(() {});
  //   print("Line 176:");
  //   flutterLocalNotificationsPlugin.show(
  //     0,
  //     'plain title',
  //     'plain body',
  //     NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         channel.id,
  //         channel.name,
  //         channelDescription: channel.description,
  //         color: Colors.blue,
  //         playSound: true,
  //         icon: '@drawable/app_icon',
  //       ),
  //     ),
  //   );
  // }

  openChatBot() {
    setState(() {});
    print("Line 203:");

    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatbotScreen()),
      );
    });
  }

  Widget _selectedScreen(int index) {
    print("Line 80: $index");
    if (index == 0) {
      return const HomeScreen();
    }
    if (index == 1) {
      return const WishlistScreen();
    }
    if (index == 2) {
      return const BarcodeScanScreen();
    }
    if (index == 3) {
      return const NearNyScreen();
    }
    if (index == 4) {
      return const ProfileScreen();
    }
    return const HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: primaryColor,
        items: const <Widget>[
          Icon(
            CupertinoIcons.house_fill,
            color: Colors.grey,
          ),
          Icon(
            CupertinoIcons.heart_fill,
            color: Colors.grey,
          ),
          Icon(
            CupertinoIcons.barcode,
            color: Colors.grey,
          ),
          Icon(
            CupertinoIcons.map_pin_ellipse,
            color: Colors.grey,
          ),
          Icon(
            Icons.person,
            color: Colors.grey,
          ),
        ],
        onTap: (index) {
          setState(() {
            Config.selectedIndex = index;
          });
        },
      ),
      body: Center(
        child: _selectedScreen(Config.selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: openChatBot,
        tooltip: "ChatBot",
        child: const Icon(Icons.chat_outlined, color: Colors.white),
      ),
    );
  }
}
