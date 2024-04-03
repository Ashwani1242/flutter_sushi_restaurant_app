import 'package:flutter/material.dart';
import 'package:sushi_restaurant_app/modules/pallete.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;
  const MyButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Pallete.buttonColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: Pallete.whiteColor),
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(icon, color: Pallete.whiteColor)
          ],
        ),
      ),
    );
  }
}
