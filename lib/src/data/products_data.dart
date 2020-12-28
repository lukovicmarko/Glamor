import 'package:flutter/material.dart';
import 'package:food/src/models/Product.dart';
import 'package:food/src/modules/http.dart';
import 'package:flutter_config/flutter_config.dart';

class ProductsData extends ChangeNotifier {
  ProductsData() {
    getProducts();
    getTopProducts();
  }

  final String apiUrl = FlutterConfig.get('API_URL');
  List<Product> _products = [];
  List<Product> _topProducts = [];

  Future getProducts() async {
    RequestResult requestResult =
        //RequestResult('https://proshop1986.herokuapp.com/api/products');
        RequestResult('http://192.168.0.37:5000/api/products');

    //'http://192.168.12.241:8095/products/all');

    var productsResponse = await requestResult.getData();

    productsResponse["products"].forEach((product) {
      _products.add(
        Product(
          id: product['id'],
          name: product['name'],
          price: product['price'].toDouble(),
          rating: product['rating'].toDouble(),
          // images: product['images'],
          description: product['description'],
          countInStock: product['countInStock'],
          reviews: product['reviews'],
          numReviews: product['numReviews'],
          preparationTime: product['preparationTime'],
        ),
      );
    });

    notifyListeners();
  }

  get products => _products;

  Future getTopProducts() async {
    RequestResult requestResult =
        //RequestResult('https://proshop1986.herokuapp.com/api/products/top');
        RequestResult('http://192.168.0.37:5000/api/products/top');
    var productsResponse = await requestResult.getData();

    productsResponse.forEach((product) {
      _topProducts.add(
        Product(
          id: product['id'],
          name: product['name'],
          price: product['price'].toDouble(),
          rating: product['rating'].toDouble(),
          images: product['image'],
          description: product['description'],
          countInStock: product['countInStock'],
          reviews: product['reviews'],
          numReviews: product['numReviews'],
          preparationTime: product['preparationTime'],
        ),
      );
    });

    notifyListeners();
  }

  get topProducts => _topProducts;
}
