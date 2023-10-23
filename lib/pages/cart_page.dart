import 'package:flutter/material.dart';
import 'package:myfirstapp/component/coffee_tile.dart';
import 'package:myfirstapp/models/coffee.dart';
import 'package:myfirstapp/models/coffee_shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeFromCart(coffee);

    print("Button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: ((context, value, child) => SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  const Text(
                    "Your Cart",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.userCart.length,
                          itemBuilder: ((context, int index) {
                            Coffee eachCoffee = value.userCart[index];
                            return CoffeeTile(
                                icon: const Icon(Icons.delete),
                                coffee: eachCoffee,
                                onPressed: () => removeFromCart(eachCoffee));
                          })))
                ],
              ),
            ))));
  }
}
