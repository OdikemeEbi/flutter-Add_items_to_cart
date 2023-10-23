import 'package:flutter/material.dart';
import 'package:myfirstapp/component/coffee_tile.dart';
import 'package:myfirstapp/models/coffee.dart';
import 'package:myfirstapp/models/coffee_shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // Add Coffee to cart
  void addToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addToCart(coffee);

    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Items Added successfully'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: ((context, value, child) => SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(
                    "How would you like your coffee",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: value.coffeeShop.length,
                        itemBuilder: (context, int index) {
                          //get individaul coffee
                          Coffee eachCoffee = value.coffeeShop[index];

                          // Return the tile for the coffees
                          return CoffeeTile(
                            icon: const Icon(Icons.add),
                            coffee: eachCoffee,
                            onPressed: () => addToCart(eachCoffee),
                          );
                        }))
              ],
            ))));
  }
}
