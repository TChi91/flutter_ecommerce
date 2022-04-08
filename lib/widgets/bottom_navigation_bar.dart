import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 2,
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
}
