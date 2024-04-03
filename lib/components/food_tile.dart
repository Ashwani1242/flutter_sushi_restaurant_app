import 'package:flutter/material.dart';
import 'package:sushi_restaurant_app/modules/food.dart';
import 'package:sushi_restaurant_app/modules/pallete.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 220,
        width: 200,
        decoration: BoxDecoration(
          color: Pallete.whiteColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Image.asset(food.imagePath),
              ),
            ),
            Text(
              food.name,
              style:
                  const TextStyle(fontSize: 24, fontFamily: 'dmSerifDisplay'),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber[700],
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      food.rating,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Pallete.primaryColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  '\$${food.price}',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
