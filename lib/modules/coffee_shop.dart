import 'package:coffee_shop/modules/coffee.dart';
import 'package:flutter/material.dart';

class Coffeeshop extends ChangeNotifier {
  List<Coffee> shop = [
    Coffee(
        name: "Black Coffee",
        price: "25",
        imagePath: "assets/images/black-coffee.png"),
    Coffee(
        name: "Cop Of Coffee",
        price: "20",
        imagePath: "assets/images/cup-of-coffee.png"),
    Coffee(
        name: "Cold Coffee",
        price: "35",
        imagePath: "assets/images/cold-coffee.png"),
    Coffee(
        name: "Fruit Drink",
        price: "15",
        imagePath: "assets/images/fruit-drink.png"),
    Coffee(
        name: "Ice-Cream",
        price: "30",
        imagePath: "assets/images/ice-cream.png"),
    Coffee(
        name: "Orange Juice",
        price: "20",
        imagePath: "assets/images/orange-juice.png"),
    Coffee(name: "Pepsi", price: "15", imagePath: "assets/images/pepsi.png"),
  ];

  final List<Coffee> _usercart = [];

  List<Coffee> get coffeeshop => shop;
  List<Coffee> get usercart => _usercart;
  void additemCoffee(Coffee coffee) {
    _usercart.add(coffee);
    notifyListeners();
  }

  void removeitemCoffee(Coffee coffee) {
    _usercart.remove(coffee);
    notifyListeners();
  }
}
