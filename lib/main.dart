import 'package:ecommerce/blocs/cart/cart_bloc.dart';
import 'package:ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/config/app_router.dart';
import 'package:ecommerce/config/theme.dart';
import 'package:ecommerce/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(LoadWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        home: const MyHomeScreen(),
        onGenerateRoute: AppRoute.onGeneratedRoute,
        initialRoute: HomeScreen.routeName,
      ),
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: SizedBox(
          height: 73.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: const Icon(Icons.home_filled),
              ),
              IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              IconButton(
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: const Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: unused_element
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
