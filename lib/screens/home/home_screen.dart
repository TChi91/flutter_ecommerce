import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/models/category.dart';
import 'package:ecommerce/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: 'Zero To Unicorn'),
      body: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.5,
          viewportFraction: 0.9,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          enlargeCenterPage: true,
        ),
        items: Category.categories
            .map((category) => HeroCarouselCard(category: category))
            .toList(),
      ),
    );
  }
}

