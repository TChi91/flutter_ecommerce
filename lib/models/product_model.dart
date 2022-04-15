import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];

  static List<Product> products = [
    const Product(
      name: 'Soft Drink #1',
      category: 'Soft Drinks',
      imageUrl:
          'https://5.imimg.com/data5/SELLER/Default/2020/10/FP/GL/OA/521830/soft-drinks-500x500.jpg',
      price: 2.99,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Soft Drink #2',
      category: 'Smoothies',
      imageUrl:
          'https://www.foodbeverageinsider.com/sites/foodbeverageinsider.com/files/styles/article_featured_standard/public/FBI%20carbonated%20soft%20drinks.jpg?itok=PXKTdVMR,',
      price: 1.99,
      isRecommended: true,
      isPopular: true,
    ),
    const Product(
      name: 'Soft Drink #3',
      category: 'Smoothies',
      imageUrl:
          'https://blog.drinktec.com/wp-content/uploads/2019/05/soft-drinks-without-sugar-1024x484.jpg',
      price: 5.00,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Soft Drink #4',
      category: 'Soft Drinks',
      imageUrl:
          'https://blog.drinktec.com/wp-content/uploads/2022/03/verschiedene-fruchtsaefte-1024x484.jpg',
      price: 3.50,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Soft Drink #5',
      category: 'Soft Drinks',
      imageUrl:
          'https://blog.drinktec.com/wp-content/uploads/2022/03/saft-und-schorlen.jpeg',
      price: 4.00,
      isRecommended: true,
      isPopular: false,
    ),
    const Product(
      name: 'Soft Drink #6',
      category: 'Soft Drinks',
      imageUrl:
          'https://www.cannonlogistics.com.au/wp-content/uploads/2015/11/soft-drink-cans-800x400.jpg',
      price: 9.99,
      isRecommended: false,
      isPopular: true,
    ),
    const Product(
      name: 'Soft Drink #7',
      category: 'Smoothies',
      imageUrl:
          'https://dmrqkbkq8el9i.cloudfront.net/Pictures/780xany/3/9/2/175392_alexloup4glwid1uhe0unsplash_390262_crop.jpg',
      price: 6.99,
      isRecommended: false,
      isPopular: false,
    ),
  ];
}
