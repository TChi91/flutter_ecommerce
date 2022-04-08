import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const MyAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        color: Colors.black,
        child: const Text(
          ' Zero To Unicorn',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Avenir',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
