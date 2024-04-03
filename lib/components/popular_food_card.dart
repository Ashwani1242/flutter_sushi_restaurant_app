import 'package:flutter/material.dart';
import 'package:sushi_restaurant_app/modules/food.dart';
import 'package:sushi_restaurant_app/modules/pallete.dart';

class PopularFoodCard extends StatelessWidget {
  final Food food;
  final VoidCallback onPressed;
  const PopularFoodCard(
      {super.key, required this.food, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Pallete.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: onPressed,
        leading: Padding(
          padding: const EdgeInsets.all(0),
          child: Image.asset(
            food.imagePath,
            height: 60,
            width: 60,
          ),
        ),
        title: Text(
          food.name,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: 'dmSerifDisplay',
          ),
        ),
        subtitle: Text(
          '\$${food.price}',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
      ),
    );
  }
}
