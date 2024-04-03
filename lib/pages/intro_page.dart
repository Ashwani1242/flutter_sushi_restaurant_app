import 'package:flutter/material.dart';
import 'package:sushi_restaurant_app/components/button.dart';
import 'package:sushi_restaurant_app/pages/menu_page.dart';
import 'package:sushi_restaurant_app/modules/pallete.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryColor,
      appBar: AppBar(
        title: const Text(
          'Sushi Launge',
          style: TextStyle(
            fontSize: 30,
            color: Pallete.whiteColor,
            fontFamily: 'dmSerifDisplay',
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                const Text(
                  '日\n本\n食',
                  style: TextStyle(
                      fontSize: 80,
                      height: 1.1,
                      fontWeight: FontWeight.bold,
                      color: Pallete.whiteColor),
                ),
                Image.asset(
                  'assets/images/sushi_1.png',
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'THE TASTE OF JAPANESE FOOD!',
              style: TextStyle(
                fontSize: 40,
                color: Pallete.whiteColor,
                fontFamily: 'dmSerifDisplay',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Feel the taste of the most popular Japanese food from anywhere and anytime',
              style:
                  TextStyle(fontSize: 16, color: Pallete.whiteColor, height: 2),
            ),
            const SizedBox(
              height: 40,
            ),
            MyButton(
              onPressed: () {
                //Navigator.pushNamed(context, '/menupage');
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) {
                    return const MenuPage();
                  }),
                );
              },
              text: 'Get Started',
              icon: Icons.arrow_forward,
            ),
          ],
        ),
      ),
    );
  }
}
