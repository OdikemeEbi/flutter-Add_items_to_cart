import 'package:flutter/material.dart';
import 'package:myfirstapp/models/coffee_shop.dart';
import 'package:myfirstapp/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => CoffeeShop()),
      builder: ((context, child) => MaterialApp(
            title: 'MAIN APP',
            theme: ThemeData(
              primarySwatch: Colors.amber,
            ),
            home: HomePage(),
          )),
    );
  }
}
