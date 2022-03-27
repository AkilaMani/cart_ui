import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  var itemCount = 1;

  increment() {
    itemCount++;
    notifyListeners();
  }

  decrement() {
    itemCount--;
    notifyListeners();
  }
}
