import 'package:MonsterApp/screens/home_screen.dart';
import 'package:MonsterApp/screens/profile_screen.dart';
import 'package:MonsterApp/screens/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Local_notification_Service.dart';
import 'analytics/branch_analytics_manager.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monster App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainActivity(),
    );
  }
}

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Initialize Branch SDK
    // FlutterBranchSdk.initSession().listen((isInit) {
    //   if (isInit) {
    //     // Get deep link parameters
    //     Map<dynamic, dynamic>? sessionParams =
    //         Branch.getLatestReferringParams();
    //     if (sessionParams != null && sessionParams.containsKey("monsterId")) {
    //       navigateToScreen(ShopFragment(), sessionParams["monsterId"]);
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Builder(
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Navigator(
                  onGenerateRoute: (settings) {
                    return MaterialPageRoute(
                      settings: settings,
                      builder: (context) {
                        switch (settings.name) {
                          case '/home':
                            return const HomeScreen();
                          case '/profile':
                            return const ProfileScreen();
                          case '/shop':
                            return ShopScreen();
                          default:
                            return const HomeScreen();
                        }
                      },
                    );
                  },
                ),
              ),
              BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: 'Shop',
                  ),
                ],
                onTap: (int index) {
                  switch (index) {
                    case 0:
                      handleHomeButtonClicked();
                      break;
                    case 1:
                      handleProfileButtonClicked();
                      break;
                    case 2:
                      handleShopButtonClicked();
                      break;
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }

  void navigateToScreen(Widget fragment) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => fragment),
    );
  }

  void handleHomeButtonClicked() {
    navigateToScreen(const HomeScreen());
  }

  void handleProfileButtonClicked() {
    navigateToScreen(const ProfileScreen());
  }

  void handleShopButtonClicked() {
    navigateToScreen(ShopScreen());
  }
}
