import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fyp_frontend/models/Cart.dart';
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
import 'package:intl/intl.dart';

import 'config.dart';
import 'models/Notification.dart';
import 'screens/notifications/notification_screen.dart';

Widget _defaultHome = const LoginScreen();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.max,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
  });

  /// If Application is on Background
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    print('A new onMessageOpenedApp event was published! On Background');
    storeNotifications(json.encode(message.data));
    Navigator.pushNamed(navigatorKey.currentState!.context, '/notification',
        arguments: {
          "message": json.encode(message.data),
        });
  });

  //////// If Application is on Foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message in the foreground!}');
    storeNotifications(json.encode(message.data));
    if (message.notification != null) {
      handleForegroundNotification(message);
    }
  });

  /// When app is in background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  //// For IOS
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

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

NotificationController notificationController =
    Get.put(NotificationController());

void storeNotifications(message) {
  if (message != null) {
    var data = json.decode(message);
    print("Line 142: ${data['notificationType']}");
    var date = DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());

    if (data['notificationType'] == "Demand") {
      DemandNotifications obj = DemandNotifications(
          notificationDemandId: data['demandId'],
          notificationMessage: data['message'],
          notificationResponse: data['response'],
          notificationType: data['notificationType'],
          notificationDemandProgress: data['demandProgress'],
          notificationDateTime: date,
          notificationDemandCreatedDateTime: data['createdDateTime'],
          isRead: true);

      notificationController.addDemandNotification(obj);
    } else if (data['notificationType'] == "Ad") {
      AdNotifications obj = AdNotifications(
          notificationTitle: data['advertismentTitle'],
          notificationDescription: data['advertismentDesc'],
          notificationCreatedDateTime: data['createdDateTime'],
          notificationAdType: data['advertismentType'],
          notificationImage: data['advertismentAttachment'],
          notificationType: data['notificationType'],
          notificationDateTime: date,
          isRead: true);

      notificationController.addAdNotification(obj);
    } else if (data['notificationType'] == "Order") {
      OrderNotifications obj = OrderNotifications(
          notificationOrderNo: data['orderNo'],
          notificationOrderDate: data['orderDate'],
          notificationOrderTime: data['orderTime'],
          notificationTotal: data['orderTotal'],
          notificationOrderPaymentMethod: data['paymentMethod'],
          notificationMessage: data['message'],
          notificationType: data['notificationType'],
          notificationDateTime: date,
          isRead: true);
      notificationController.addOrderNotification(obj);
    } else if (data['notificationType'] == "Offer") {
      OfferNotifications obj = OfferNotifications(
          notificationTitle: data['advertismentTitle'],
          notificationDescription: data['advertismentDesc'],
          notificationCreatedDateTime: data['createdDateTime'],
          notificationAdType: data['advertismentType'],
          notificationStartDate: data['startDate'],
          notificationEndDate: data['endDate'],
          notificationDiscount: data['discount'],
          notificationCategoryName: data['categoryName'],
          notificationType: data['notificationType'],
          notificationDateTime: date,
          isRead: true);

      notificationController.addOfferNotification(obj);
    }
  }
}

///////// handleForegroundNotification //////////
handleForegroundNotification(RemoteMessage message) {
  print("handleForegroundNotification: $message");
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
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
          color: primaryColor,
          playSound: true,
          icon: 'app_icon',
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// If Application is on Closed or Killed
  void handleMessageOnBackground() {
    FirebaseMessaging.instance.getInitialMessage().then(
      (RemoteMessage? message) {
        if (message != null) {
          print('A new onMessageOpenedApp event was published! On Killed');
          storeNotifications(json.encode(message.data));
          Navigator.pushNamed(
              navigatorKey.currentState!.context, '/notification',
              arguments: {
                "message": json.encode(message.data),
              });
        }
      },
    );
  }

  @override
  void initState() {
    handleMessageOnBackground();
    super.initState();
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
        '/notification': (context) => const NotificationScreen(),
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

  final CartController cartController = Get.put(CartController());

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
  void initState() {
    super.initState();
    cartController.cartProducts.clear();
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
