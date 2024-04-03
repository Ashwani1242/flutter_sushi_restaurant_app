import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant_app/modules/data.dart';
import 'package:sushi_restaurant_app/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MaterialApp(
        title: 'Sushi Restaurant',
        home: IntroPage(),
      ),
    );
  }
}
