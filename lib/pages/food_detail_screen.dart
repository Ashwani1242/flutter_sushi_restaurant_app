import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant_app/components/button.dart';
import 'package:sushi_restaurant_app/modules/data.dart';
import 'package:sushi_restaurant_app/modules/food.dart';
import 'package:sushi_restaurant_app/modules/pallete.dart';

class FoodDetailScreen extends StatefulWidget {
  final Food food;
  const FoodDetailScreen({super.key, required this.food});

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  int quantityCount = 0;

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) quantityCount--;
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.greyColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Details',
          style: TextStyle(
            fontFamily: 'dmSerifDisplay',
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 50),
                    child: Image.asset(
                      widget.food.imagePath,
                      scale: .1,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber[700],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.food.rating,
                        style: const TextStyle(
                            fontSize: 16,
                            color: Pallete.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.food.name,
                    style: const TextStyle(
                      fontSize: 30,
                      fontFamily: 'dmSerifDisplay',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Discription',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Aliquip pariatur irure laborum do consectetur tempor occaecat nulla est elit culpa incididunt non cupidatat. Ea exercitation laborum Lorem irure fugiat in laborum aliqua in. Id incididunt id nisi esse aliqua culpa in velit anim ex. Voluptate reprehenderit in irure et deserunt adipisicing magna. Laboris consectetur ullamco velit laboris occaecat sit occaecat aliqua velit tempor officia ea sunt. Incididunt ex id fugiat laborum dolor dolore amet aliquip culpa nulla voluptate cillum mollit.',
                    style: TextStyle(
                        fontSize: 15, color: Colors.black54, height: 2),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(25),
            color: Pallete.primaryColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.food.price}',
                      style: const TextStyle(
                        color: Pallete.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Pallete.buttonColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            onPressed: decrementQuantity,
                            icon: const Icon(
                              Icons.remove,
                              color: Pallete.whiteColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: Center(
                            child: Text(
                              quantityCount.toString(),
                              style: const TextStyle(
                                color: Pallete.whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Pallete.buttonColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            onPressed: incrementQuantity,
                            icon: const Icon(
                              Icons.add,
                              color: Pallete.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                MyButton(
                  text: 'Add To Cart',
                  onPressed: () {
                    if (quantityCount == 0) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Item cannot be 0'),
                        ),
                      );
                      return;
                    }
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(widget.food, quantityCount);
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added To Cart.'),
                      ),
                    );
                  },
                  icon: Icons.arrow_forward,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
