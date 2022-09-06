import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp_frontend/screens/map/nearby_screen.dart';
import 'package:fyp_frontend/screens/register/login_screen.dart';
import 'package:get/get.dart';
import 'package:fyp_frontend/constants.dart';
import 'package:fyp_frontend/screens/QRScan/qr_scan_screen.dart';
import 'package:fyp_frontend/screens/home/home_screen.dart';
import 'package:fyp_frontend/screens/profile/profile_screen.dart';
import 'package:fyp_frontend/screens/register/register_screen.dart';
import 'package:fyp_frontend/screens/toShopList/toShop_screen.dart';
import 'package:fyp_frontend/screens/wishlist/wishlist_screen.dart';
import 'package:fyp_frontend/services/shared_service.dart';
import 'package:fyp_frontend/utils/shared_preferences.dart';

import 'config.dart';

Widget _defaultHome = const LoginScreen();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = const MainScreen();
  }
  await UserSharedPreferences.init();
  runApp(const ProviderScope(
    child: GetMaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Fast Mart',
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
        // 'category_product': (context) => const CategoryScreen(),
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

  Widget _selectedScreen(int index) {
    print("Line 80: $index");
    if (index == 0) {
      return const HomeScreen();
    }
    if (index == 1) {
      return const WishlistScreen();
    }
    if (index == 2) {
      return const QRScanScreen();
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
    );
  }
}
