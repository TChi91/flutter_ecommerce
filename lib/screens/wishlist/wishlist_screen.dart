import 'package:ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WishlistScreen(),
    );
  }

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(title: 'Your Wishlist'),
        body:
            BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
          if (state is WishlistLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WishlistLoaded) {
            return GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 15.0,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.4,
                ),
                itemCount: state.wishlist.products.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: ProductCard(
                      product: state.wishlist.products[index],
                      widthFactor: 1.1,
                      leftPosition: 100.0,
                      rightPosition: 20.0,
                      isWishlist: true,
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text('Error'),
            );
          }
        }),
      ),
    );
  }
}
