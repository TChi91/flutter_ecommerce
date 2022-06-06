import 'package:ecommerce/models/models.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartScreen(),
    );
  }

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MyAppBar(title: 'Cart'),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add 20\$ for FREE delivery',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text('Add more items!'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        elevation: 0.0,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: 550,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    CartProductCard(product: Product.products[1]),
                    CartProductCard(product: Product.products[1]),
                    CartProductCard(product: Product.products[1]),
                    CartProductCard(product: Product.products[1]),
                    CartProductCard(product: Product.products[1]),
                    CartProductCard(product: Product.products[1]),
                    CartProductCard(product: Product.products[1]),
                    CartProductCard(product: Product.products[1]),
                    CartProductCard(product: Product.products[1]),
                    CartProductCard(product: Product.products[1]),
                    CartProductCard(product: Product.products[2]),
                  ],
                ),
              ),
              const Spacer(),
              const Divider(thickness: 3.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'SUBTOTAL',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          '10\$',
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DELIVERY FEES',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          '2\$',
                          style: Theme.of(context).textTheme.headline5,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Stack(
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'TOTAL',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white),
                            ),
                            Text(
                              '12.00\$',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
