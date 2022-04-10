import 'package:ecommerce/config/app_router.dart';
import 'package:ecommerce/config/theme.dart';
import 'package:ecommerce/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      home: const MyHomeScreen(),
      onGenerateRoute: AppRoute.onGeneratedRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeScreen(),
          CartScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        onTap: _onTap,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            label: 'Card',
            icon: Icon(
              Icons.shopping_cart,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            label: 'Profile',
            icon: Icon(Icons.person),
          )
        ],
      ),
    );
  }

  _onTap(int tabIndex) {
    setState(() {
      currentIndex = tabIndex;
    });
    // switch (tabIndex) {
    //   case 0:
    //     Navigator.pushNamed(context, "/");
    //     break;
    //   case 1:
    //     Navigator.pushNamed(context, "/cart");
    //     break;
    //   case 2:
    //     Navigator.pushNamed(context, "/profile");
    //     break;
    // }
  }
}
