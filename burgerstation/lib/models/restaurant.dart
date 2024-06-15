import 'package:burgerstation/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // burgers
    Food(
      name: "Vege Burger", 
      description: "A veggie burger, delicious and nutritious alternative to traditional meat patties, crafted from a blend of vegetables, legumes, and grains. ", 
      imagePath: "lib/images/burgers/Vege2.jpg", 
      price: 990, 
      category: FoodCategory.burgers, 
      availableAddons: [ 
        Addon(name: "Extra Avocado", price: 250),
        Addon(name: "Extra Lettuce", price: 120),
        Addon(name: "Extra Tomatoes", price: 100),
      ],
    ),
    Food(
      name: "Grilled BBQ Chicken Burger", 
      description: "A juicy, grilled chicken breast slathered in smoky BBQ sauce, topped with fresh lettuce, ripe tomatoes, and creamy coleslaw, all nestled in a soft, toasted bun.", 
      imagePath: "lib/images/burgers/grilledbbqchicken.jpg", 
      price: 1350, 
      category: FoodCategory.burgers, 
      availableAddons: [ 
        Addon(name: "Extra BBQ sauce", price: 225),
        Addon(name: "Extra Chicken", price: 400),
        Addon(name: "Extra Lettuce", price: 120),
      ],
    ),
    Food(
      name: "Bunless Chicken Burger", 
      description: "A succulent, fried chicken breast served without the bun, stacked with 2 layers of chicken with cheese and chicken ham inbetween. ", 
      imagePath: "lib/images/burgers/bunlesschickenburger.jpg", 
      price: 1400, 
      category: FoodCategory.burgers, 
      availableAddons: [ 
        Addon(name: "Extra Sauce", price: 200),
        Addon(name: "Extra Mayo", price: 200),
        Addon(name: "Extra Cheese", price: 250),
      ],
    ),
    Food(
      name: "BBQ Piston Beef", 
      description: "A thick, juicy beef patty grilled to perfection and coated with a rich, tangy BBQ sauce, topped with crispy onion rings and cheddar cheese.", 
      imagePath: "lib/images/burgers/bbqpistonbeef.jpg", 
      price: 1500, 
      category: FoodCategory.burgers, 
      availableAddons: [ 
        Addon(name: "Extra Mayo", price: 200),
        Addon(name: "Extra Cheese", price: 250),
        Addon(name: "Extra Sauce", price: 200),
      ],
    ),
    Food(
      name: "Hybrid Chicken and Beef Burger", 
      description: "This burger is a blend of savory ground beef and tender chicken, seasoned perfectly. Topped with melted cheese, fresh veggies, and a drizzle of special sauce.", 
      imagePath: "lib/images/burgers/hybridchickenandbeef.jpg", 
      price: 1750, 
      category: FoodCategory.burgers, 
      availableAddons: [ 
        Addon(name: "Extra Cheese", price: 250),
        Addon(name: "Extra Sauce", price: 200),
        Addon(name: "Extra Mayo", price: 200),
      ],
    ),
    
    // salads
    Food(
      name: "Asian Sesame Chicken Salad", 
      description: "A mix of crisp greens, mandarin oranges, and grilled chicken, all tossed in a tangy sesame seed dressing. Topped with toasted sesame seeds.", 
      imagePath: "lib/images/salads/AsianSesameChickenSalad.jpg", 
      price: 850, 
      category: FoodCategory.salads, 
      availableAddons: [ 
        Addon(name: "Extra Avocado", price: 250),
        Addon(name: "Extra Lettuce", price: 120),
        Addon(name: "Extra Tomatoes", price: 100),
      ],
    ),
    Food(
      name: "Ceasar Salad", 
      description: "Fresh romaine lettuce tossed with creamy Caesar dressing, crunchy croutons, and a generous sprinkling of Parmesan cheese.", 
      imagePath: "lib/images/salads/CeasarSalad.jpg", 
      price: 800, 
      category: FoodCategory.salads, 
      availableAddons: [ 
        Addon(name: "Extra Croutons", price: 180),
        Addon(name: "Extra Lettuce", price: 120),
        Addon(name: "Extra Ceasar dressing", price: 100),
      ],
    ),
    Food(
      name: "Cobb Salad", 
      description: "A salad with chopped chicken, crispy bacon, hard-boiled eggs, blue cheese, and tomatoes, all arranged on mixed greens. Drizzled with a tangy vinaigrette.", 
      imagePath: "lib/images/salads/CobbSalad.jpg", 
      price: 950, 
      category: FoodCategory.salads, 
      availableAddons: [ 
        Addon(name: "Extra Egg", price: 250),
        Addon(name: "Extra Lettuce", price: 120),
        Addon(name: "Extra Bacon crisps", price: 220),
      ],
    ),
    Food(
      name: "Greek Salad", 
      description: "A refreshing salad with chunks of ripe tomatoes, crisp cucumbers, red onions, Kalamata olives, and feta cheese, tossed in a light oregano-infused vinaigrette.", 
      imagePath: "lib/images/salads/greeksalad.jpg", 
      price: 850, 
      category: FoodCategory.salads, 
      availableAddons: [ 
        Addon(name: "Extra Cheese", price: 250),
        Addon(name: "Extra Avacado", price: 120),
        Addon(name: "Extra Olives", price: 180),
      ],
    ),
    Food(
      name: "Seven Layer Salad", 
      description: "A salad with layers of crisp lettuce, peas, tomatoes, hard-boiled eggs, bacon, shredded cheese, and a creamy dressing. Served in a clear dish to show its colorful layers.", 
      imagePath: "lib/images/salads/sevenlayersalad.jpg", 
      price: 1000, 
      category: FoodCategory.salads, 
      availableAddons: [ 
        Addon(name: "Extra Cheese", price: 250),
        Addon(name: "Extra Bacon crisps", price: 200),
        Addon(name: "Extra Peas", price: 150),
      ],
    ),

    // sides
    Food(
      name: "Garlic Bread", 
      description: "Crispy on the outside and soft on the inside, this classic side dish features slices of bread slathered with a savory blend of garlic, butter, and herbs.", 
      imagePath: "lib/images/sides/GarlicBread.jpg", 
      price: 700, 
      category: FoodCategory.sides, 
      availableAddons: [ 
        Addon(name: "Extra Garlic", price: 80),
        Addon(name: "Extra Butter", price: 100),
        Addon(name: "Extra Slice", price: 150),
      ],
    ),
    Food(
      name: "Mac and Cheese", 
      description: "This creamy dish combines tender macaroni pasta with a rich, velvety cheese sauce. Topped with a golden breadcrumb crust.", 
      imagePath: "lib/images/sides/macandcheese.jpg", 
      price: 900, 
      category: FoodCategory.sides, 
      availableAddons: [ 
        Addon(name: "Extra Cheese", price: 250),
        Addon(name: "Extra Mac", price: 150),
        Addon(name: "Extra Sauce", price: 180),
      ],
    ),
    Food(
      name: "Onion Rings", 
      description: "These crispy, golden rings are made from thick slices of onions, dipped in a seasoned batter, and deep-fried to perfection. Served with a side of dipping sauce.", 
      imagePath: "lib/images/sides/onionrings.jpg", 
      price: 750, 
      category: FoodCategory.sides, 
      availableAddons: [ 
        Addon(name: "Extra Onion Ring", price: 100),
        Addon(name: "Extra Sauce", price: 150),
        Addon(name: "Extra Mayo", price: 150),
      ],
    ),
    Food(
      name: "Loaded Chicken Fries", 
      description: "Crispy French fries topped with seasoned chicken pieces, melted cheese, bacon bits, and a drizzle of ranch or BBQ sauce.", 
      imagePath: "lib/images/sides/loadedfries.jpg", 
      price: 990, 
      category: FoodCategory.sides, 
      availableAddons: [ 
        Addon(name: "Extra Fries", price: 200),
        Addon(name: "Extra Chicken ", price: 200),
        Addon(name: "Extra Sauce", price: 120),
      ],
    ),
    Food(
      name: "Honey BBQ Chicken Wings", 
      description: "Juicy chicken wings coated in a smoky, tangy BBQ sauce and grilled or baked until tender. These wings offer a delicious balance of sweet and savory flavors with a slight char.", 
      imagePath: "lib/images/sides/honeybbqchickenwings.jpg", 
      price: 990, 
      category: FoodCategory.sides, 
      availableAddons: [ 
        Addon(name: "Extra sauce", price: 100),
        Addon(name: "Extra Wing", price: 150),
        Addon(name: "Extra Dipping Sauce", price: 150),
      ],
    ),

    // desserts
    Food(
      name: "Mini Strawberry Cheescake", 
      description: "These bite-sized treats feature a creamy cheesecake filling atop a buttery graham cracker crust, topped with fresh, juicy strawberries.", 
      imagePath: "lib/images/desserts/ministrawberrycheesecakes.jpg", 
      price: 1000, 
      category: FoodCategory.desserts, 
      availableAddons: [ 
        Addon(name: "Extra Strawberry", price: 190),
        Addon(name: "Extra Cheescake", price: 450),
        Addon(name: "Extra Fruit", price: 200),
      ],
    ),
    Food(
      name: "Chocolate Chip Cookies", 
      description: "These cookies are loaded with gooey chocolate chips in every bite. Crispy on the edges and chewy in the center.", 
      imagePath: "lib/images/desserts/chocchipcookies.jpg", 
      price: 600, 
      category: FoodCategory.desserts, 
      availableAddons: [ 
        Addon(name: "Extra Chocolate chips", price: 140),
        Addon(name: "Extra Cookie", price: 200),
        Addon(name: "Extra IceCream", price: 180),
      ],
    ),
    Food(
      name: "Chocolate Lava Cake", 
      description: "This dessert features a rich, moist chocolate cake with a molten chocolate center that oozes out when cut into. Served warm, it’s often paired with a scoop of vanilla ice cream.", 
      imagePath: "lib/images/desserts/choclavacake.jpg", 
      price: 900, 
      category: FoodCategory.desserts, 
      availableAddons: [ 
        Addon(name: "Extra Lava", price: 180),
        Addon(name: "Extra Lava Cake", price: 450),
        Addon(name: "Extra IceCream", price: 180),
      ],
    ),
    Food(
      name: "Fruit Tart", 
      description: "A delicate pastry shell filled with smooth, creamy custard and topped with seasonal fruits. These tarts offer a perfect balance of sweet and tart flavors.", 
      imagePath: "lib/images/desserts/fruittarta.jpg", 
      price: 1000, 
      category: FoodCategory.desserts, 
      availableAddons: [ 
        Addon(name: "Extra Blackberries", price: 180),
        Addon(name: "Extra Cream", price: 140),
        Addon(name: "Extra Tart", price: 250),
      ],
    ),
    Food(
      name: "Chocolate Buscuit Pudding", 
      description: "Layers of crunchy biscuits and rich chocolate pudding create a delightful contrast in this no-bake dessert. Chilled to perfection.", 
      imagePath: "lib/images/desserts/chocbuscuitpudding.jpg", 
      price: 800, 
      category: FoodCategory.desserts, 
      availableAddons: [ 
        Addon(name: "Extra Buscuits", price: 150),
        Addon(name: "Extra IceCream", price: 180),
        Addon(name: "Extra Pudding", price: 400),
      ],
    ),

    // drinks
    Food(
      name: "Vanilla Milkshake", 
      description: "This milkshake blends vanilla ice cream with milk, creating a smooth and rich treat. Topped with whipped cream and sprinkles.", 
      imagePath: "lib/images/drinks/vanillamilkshake.jpg", 
      price: 900, 
      category: FoodCategory.drinks, 
      availableAddons: [ 
        Addon(name: "Extra Sprinkles", price: 100),
        Addon(name: "Extra Whipping Cream", price: 120),
        Addon(name: "Extra Sweetnes", price: 100),
      ],
    ),
    Food(
      name: "Chocolate Milkshake", 
      description: "A mix of chocolate ice cream and milk, blended to a thick and creamy consistency. Topped with whipped cream and a drizzle of chocolate syrup.", 
      imagePath: "lib/images/drinks/chocmilkshake.jpg", 
      price: 900, 
      category: FoodCategory.drinks, 
      availableAddons: [ 
        Addon(name: "Extra Sprinkles", price: 100),
        Addon(name: "Extra Whipping Cream", price: 120),
        Addon(name: "Extra Sweetnes", price: 100),
      ],
    ),
    Food(
      name: "Strawberry Refresher", 
      description: "A refreshing beverage made with real strawberry puree, sparkling water, and a hint of lime.", 
      imagePath: "lib/images/drinks/Strawberryrefresher.jpg", 
      price: 900, 
      category: FoodCategory.drinks, 
      availableAddons: [ 
        Addon(name: "Extra Strawberry", price: 200),
        Addon(name: "Extra Ice", price: 100),
        Addon(name: "Extra Mint Leaves", price: 100),
      ],
    ),
    Food(
      name: "Guava Juice", 
      description: "This tropical juice captures the sweet and slightly tangy flavor of ripe guava. It's a refreshing and nutritious choice for some fruity goodness.", 
      imagePath: "lib/images/drinks/guavajuice.jpg", 
      price: 800, 
      category: FoodCategory.drinks, 
      availableAddons: [ 
        Addon(name: "Extra Guava", price: 150),
        Addon(name: "Extra Ice", price: 100),
        Addon(name: "Extra Mint Leaves", price: 100),
      ],
    ),
    Food(
      name: "Mango Juice", 
      description: "Bursting with the sweet and exotic flavor of ripe mangoes, this juice is a tropical delight. Smooth and refreshing.", 
      imagePath: "lib/images/drinks/mangojuice.jpg", 
      price: 800, 
      category: FoodCategory.drinks, 
      availableAddons: [ 
        Addon(name: "Extra Mango", price: 150),
        Addon(name: "Extra Ice", price: 100),
        Addon(name: "Extra Mint Leaves", price: 100),
      ],
    ),
  ];

  /*

  G E T T E R S 

  */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*

  O P E R A T I O N S 

  */

  // user cart
  final List<CartItem>_cart = [];

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food items are the same
      bool isSameFood = item.food == food;

      // check if the list of selected addons are the same
      bool isSameAddons = 
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if the item already exists, increase it's quantity
    if (cartItem !=null) {
      cartItem.quantity++;
    }

    // otherwise, add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food, 
          selectedAddons: selectedAddons
        ),
      );
    }
  notifyListeners();
  }

  // remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
       _cart[cartIndex].quantity--;
    }  else {
        _cart.removeAt(cartIndex);
      }
    } 

    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
    }

  // get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for(CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*

  H E L P E R S 

  */

  // generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate = 
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("---------");

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} × ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("  Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("---------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    
    return receipt.toString();
  }

  // format double value into money
String _formatPrice(double price) {
  return "Rs${price.toStringAsFixed(2)}";
}

  // format list of addons into a string summary 
  String _formatAddons(List<Addon> addons) {
    return addons
       .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
       .join(",");
  }
}
