import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant_app/components/button.dart';
import 'package:sushi_restaurant_app/modules/data.dart';
import 'package:sushi_restaurant_app/modules/pallete.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MyButton(
            text: 'Pay Now', onPressed: () {}, icon: Icons.arrow_forward),
      ),
      backgroundColor: Pallete.primaryColor,
      appBar: AppBar(
        foregroundColor: Pallete.greyColor,
        title: const Text(
          'Cart',
          style: TextStyle(
            fontFamily: 'dmSerifDisplay',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: cart.isEmpty
          ? Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SizedBox(
                  width: 350,
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset(
                          'assets/images/sushi.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const Text(
                        'Your Cart is Empty!',
                        style: TextStyle(
                          color: Pallete.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Looks like you have not added anything to your cart. Go ahead & explore top categories',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Pallete.greyColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemCount: cart.length,
              itemBuilder: ((context, index) {
                final cartItem = cart[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Pallete.buttonColor),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Image.asset(
                        cartItem.imagePath,
                        height: 60,
                        width: 60,
                      ),
                    ),
                    title: Text(
                      cartItem.name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Pallete.whiteColor,
                        fontFamily: 'dmSerifDisplay',
                      ),
                    ),
                    subtitle: Text(
                      '\$${cartItem.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Pallete.greyColor,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              backgroundColor: Pallete.secondaryColor,
                              title: const Text(
                                "Remove Item?",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              content: const Text(
                                "Are you sure you want to remove this item form your cart?",
                                style: TextStyle(fontSize: 15),
                              ),
                              actionsAlignment: MainAxisAlignment.spaceAround,
                              actions: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(90, 30),
                                  ),
                                  onPressed: () {
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .removeFromcart(cartItem);
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Item Removed'),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Pallete.blackColor,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(90, 30),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Pallete.blackColor,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Pallete.whiteColor,
                      ),
                    ),
                  ),
                );
              }),
            ),
    );
  }
}
