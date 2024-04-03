import 'package:flutter/material.dart';
import 'package:sushi_restaurant_app/modules/food.dart';

List foodMenu = [
  Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'assets/images/sushi_2.png',
      rating: '4.8'),
  Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'assets/images/sushi_3.png',
      rating: '4.8'),
  Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'assets/images/sushi_4.png',
      rating: '4.8'),
  Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'assets/images/sushi_5.png',
      rating: '4.8'),
  Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'assets/images/sushi_6.png',
      rating: '4.8'),
  Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'assets/images/sushi_7.png',
      rating: '4.8'),
  Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'assets/images/sushi_8.png',
      rating: '4.8'),
  Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'assets/images/sushi_9.png',
      rating: '4.8'),
  Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'assets/images/sushi_10.png',
      rating: '4.8'),
  Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'assets/images/sushi_11.png',
      rating: '4.8'),
];

List popularFood = [
  Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'assets/images/sushi_11.png',
      rating: '4.8'),
  Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'assets/images/sushi_10.png',
      rating: '4.8'),
  Food(
      name: 'Salmon Sushi',
      price: '21.00',
      imagePath: 'assets/images/sushi_2.png',
      rating: '4.8'),
];

class CartProvider extends ChangeNotifier {
  final List<Food> cart = [];

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromcart(Food foodItem) {
    cart.remove(foodItem);
    notifyListeners();
  }
}
