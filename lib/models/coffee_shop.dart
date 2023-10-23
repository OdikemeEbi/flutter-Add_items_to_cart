import 'package:flutter/material.dart';
import 'package:myfirstapp/models/coffee.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee for sale list
  final List<Coffee> _shop = [
    Coffee(
      name: "Black coffee",
      price: "4.40",
      imagePath: "assets/images/boyss.jpg",
    ),
    Coffee(
      name: "Sweet coffee",
      price: "4.40",
      imagePath: "assets/images/chef.jpg",
    ),
    Coffee(
      name: "white coffee",
      price: "4.40",
      imagePath: "assets/images/burger2.jpg",
    ),
    Coffee(
      name: "Tee coffee",
      price: "4.40",
      imagePath: "assets/images/burger1.jpg",
    )
  ];

  // user cart
  List<Coffee> _userCart = [];

  // get user list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add items to cart
  void addToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove items from cart
  void removeFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
