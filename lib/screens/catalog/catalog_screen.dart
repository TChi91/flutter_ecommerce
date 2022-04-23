import 'package:ecommerce/models/category_model.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final Category category;

  const CatalogScreen({Key? key, required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: MyAppBar(title: category.name),
      body: GridView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.15,
          ),
          itemCount: categoryProducts.length,
          itemBuilder: (context, index) {
            return Center(
              child: ProductCard(
                product: categoryProducts[index],
                widthFactor: 2.5,
              ),
            );
          }),
    );
  }
}
