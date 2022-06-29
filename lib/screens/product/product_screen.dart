import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/blocs/cart/cart_bloc.dart';
import 'package:ecommerce/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductScreen(
        product: product,
      ),
    );
  }

  final Product product;
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(
          title: product.name,
        ),
        body: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                enlargeCenterPage: true,
              ),
              items: [
                HeroCarouselCard(
                  product: product,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60.0,
                    color: Colors.black.withAlpha(50),
                    alignment: Alignment.bottomCenter,
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    color: Colors.black,
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Soft Drink #1',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '2.99\$',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text('Product Information',
                    style: Theme.of(context).textTheme.headline3),
                children: [
                  ListTile(
                    title: Text(
                        'Let\'s Make our Product Screen using Carousel Slider and Expanded Titles - EP9 - The eCommerce Series',
                        style: Theme.of(context).textTheme.bodyText1),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: ExpansionTile(
                title: Text('Delivery Information',
                    style: Theme.of(context).textTheme.headline3),
                children: [
                  ListTile(
                    title: Text(
                        'Let\'s Make our Product Screen using Carousel Slider and Expanded Titles - EP9 - The eCommerce Series',
                        style: Theme.of(context).textTheme.bodyText1),
                  )
                ],
              ),
            )
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
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
                BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    return IconButton(
                      color: Colors.white,
                      onPressed: () {
                        context
                            .read<WishlistBloc>()
                            .add(AddProductToWishlist(product));
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Added to your wishlist')));
                      },
                      icon: const Icon(Icons.favorite),
                    );
                  },
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {
                        context.read<CartBloc>().add(AddProduct(product));
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: Text('ADD TO CART',
                          style: Theme.of(context).textTheme.headline3!),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
