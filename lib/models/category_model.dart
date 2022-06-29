import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    const Category(
      name: 'Soft Drinks',
      imageUrl:
          'https://www.yummytoddlerfood.com/wp-content/uploads/2021/02/toddler-smoothies-on-counter-with-produce.jpg',
    ),
    const Category(
      name: 'Smoothies',
      imageUrl:
          'https://www.yummytoddlerfood.com/wp-content/uploads/2021/02/toddler-smoothies-on-counter-with-produce.jpg',
    ),
    const Category(
      name: 'Water',
      imageUrl:
          'https://domf5oio6qrcr.cloudfront.net/medialibrary/7909/b8a1309a-ba53-48c7-bca3-9c36aab2338a.jpg',
    ),
  ];
}
