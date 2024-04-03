import 'package:flutter/material.dart';
import 'package:sushi_restaurant_app/components/button.dart';
import 'package:sushi_restaurant_app/components/food_tile.dart';
import 'package:sushi_restaurant_app/components/popular_food_card.dart';
import 'package:sushi_restaurant_app/modules/data.dart';
import 'package:sushi_restaurant_app/pages/cart_page.dart';
import 'package:sushi_restaurant_app/pages/food_detail_screen.dart';
import 'package:sushi_restaurant_app/modules/pallete.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<String> filters = [
    'All',
    'Sushi',
    'Ramen',
    'Udon',
    'Danggo',
    'Drinks',
    'Others'
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.secondaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_rounded),
        ),
        title: const Text(
          'Sushi Launge',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'dmSerifDisplay',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const CartPage();
                  },
                ));
              },
              icon: const Icon(
                Icons.shopping_cart_rounded,
              ))
        ],
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Field
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Pallete.whiteColor,
                    hintText: 'Search',
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                            color: Pallete.primaryColor, width: 1.5)),
                  ),
                ),
                // Spacing
                const SizedBox(height: 20),
                // Promo Banner
                Container(
                  decoration: BoxDecoration(
                    color: Pallete.primaryColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Get 60% Promo',
                            style: TextStyle(
                              color: Pallete.whiteColor,
                              fontSize: 20,
                              fontFamily: 'dmSerifDisplay',
                            ),
                          ),
                          const SizedBox(height: 20),
                          MyButton(
                              text: 'Redeem',
                              onPressed: () {},
                              icon: Icons.arrow_forward)
                        ],
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            'assets/images/sushi_9.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Spacing
                const SizedBox(height: 20),
                // Filters
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedFilter = filter;
                            });
                          },
                          child: Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            backgroundColor: selectedFilter == filter
                                ? Pallete.buttonColor
                                : Pallete.secondaryColor,
                            label: Text(
                              filter,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: selectedFilter == filter
                                      ? Pallete.whiteColor
                                      : Pallete.blackColor),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: filters.length,
                  ),
                ),
                // Spacing
                const SizedBox(height: 25),
                // Foof Menu heading
                const Text(
                  'Food Menu  /  寿司',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                // Spacing
                const SizedBox(height: 15),
                // Food Menu
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodMenu.length,
                    itemBuilder: ((context, index) {
                      final foodM = foodMenu[index];
                      return FoodTile(
                        food: foodM,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) {
                                return FoodDetailScreen(
                                  food: foodM,
                                );
                              }),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
          // Popular Food Section
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Pallete.primaryColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Popular Food   /  人気',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Pallete.whiteColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: popularFood.length,
                    itemBuilder: (context, index) {
                      final popFood = popularFood[index];
                      return PopularFoodCard(
                        food: popFood,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) {
                                return FoodDetailScreen(
                                  food: popFood,
                                );
                              }),
                            ),
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
