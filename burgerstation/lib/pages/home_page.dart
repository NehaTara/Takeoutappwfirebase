import 'package:burgerstation/components/my_current_location.dart';
import 'package:burgerstation/components/my_description_box.dart';
import 'package:burgerstation/components/my_drawer.dart';
import 'package:burgerstation/components/my_food_tile.dart';
import 'package:burgerstation/components/my_silver_app_bar.dart';
import 'package:burgerstation/components/my_tab_bar.dart';
import 'package:burgerstation/models/food.dart';
import 'package:burgerstation/models/restaurant.dart';
import 'package:burgerstation/pages/food_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  ConnectivityResult? connectivityResult;
  //tab Controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = 
        TabController(length: FoodCategory.values.length, vsync: this);
    checkConnectivity();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        connectivityResult = result;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void checkConnectivity() async {
    connectivityResult = await Connectivity().checkConnectivity();
    setState(() {});
  }

  // sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      // get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          // get individual food
          final food = categoryMenu[index];

          // return food tile UI
          return FoodTile(
            food: food, 
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                if (connectivityResult == ConnectivityResult.none)
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Center(
                      child: Text(
                        'Connect to the internet to view location and delivery data',
                        style: TextStyle(
                          color: Color.fromRGBO(241, 30, 30, 1),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                else ...[
                  const MyCurrentLocation(),
                  const MyDescriptionBox(),
                ],
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
