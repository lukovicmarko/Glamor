import 'package:flutter/material.dart';
import 'package:food/src/models/Product.dart';

class CartData extends ChangeNotifier {
  final List<Product> _cart = [];

  int get cartCount {
    return _cart.length;
  }

  get cart => _cart;

  /*pronalazi proizvod u kolekciji proizvoda po atributu ID*/
  getProductInCartByID(productId, products) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].id == productId) {
        return true;
      } else {
        return false;
      }
    }
  }

  /*pronalazi proizvod u kolekciji proizvoda po atributu ID*/
  getProductByID(productId, products) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].id == productId) {
        return products[i];
      }
    }
  }

  void addProductToCart(Product product) {
    final productInCartById = getProductInCartByID(product.id, _cart);
    final productInCart = getProductByID(product.id, _cart);

    if (productInCartById == true) {
      if (productInCart.total > productInCart.countInStock) {
        return;
      } else {
        productInCart.total++;
      }
    } else {
      _cart.add(product);
    }

    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void incrementProductTotal(Product product) {
    if (product.countInStock < product.total) {
      return;
    } else {
      product.total++;
    }

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
