import 'package:flutter/material.dart';
import 'package:food/src/models/Product.dart';

class CartData extends ChangeNotifier {
  final List<Product> _cart = [];

  int get cartCount {
    return _cart.length;
  }

  get cart => _cart;

  void addProductToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void incrementProductTotal(Product product) {
    product.total++;
    notifyListeners();
  }

  void decrementProductTotal(Product product) {
    if (product.total < 2) {
      return;
    } else {
      product.total--;
    }
    notifyListeners();
  }

  double getTotalAmount(cart) {
    double totalAmount = 0.0;
    cart.forEach((item) {
      totalAmount += item.total * item.price;
    });
    return totalAmount;
  }
}
