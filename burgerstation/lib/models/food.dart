// food item
class Food {
  final String name;           // vege burger
  final String description;    // a burger full of vege
  final String imagePath;      // lib/images/vege_burger.png
  final double price;          // Rs1200
  final FoodCategory category; // burger
  List<Addon> availableAddons; // [ extra vege, sauce, extra patty ]


  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

// food categories
enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

// food addons
class Addon {
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
  });
}