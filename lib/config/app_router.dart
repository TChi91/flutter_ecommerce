import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/screens/screens.dart';
import 'package:ecommerce/widgets/appbar.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case ProductScreen.routeName:
        return ProductScreen.route();
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (context) => SafeArea(
        child: Scaffold(
          appBar: const MyAppBar(title: 'Error!'),
          body: Center(
            child: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
    );
  }
}
