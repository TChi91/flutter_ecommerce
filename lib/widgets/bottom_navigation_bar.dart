import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onTap,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          backgroundColor: Colors.red,
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Card',
          icon: Icon(
            Icons.shopping_cart,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Icon(Icons.person),
        )
      ],
    );
  }

  _onTap(int tabIndex) {
    setState(() {
      currentIndex = tabIndex;
    });
    switch (tabIndex) {
      case 0:
        Navigator.pushNamed(context, "/");
        break;
      case 1:
        Navigator.pushNamed(context, "/cart");
        break;
      case 2:
        Navigator.pushNamed(context, "/profile");
        break;
    }
  }
}
