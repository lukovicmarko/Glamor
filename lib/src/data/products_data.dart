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
        RequestResult('https://lukovicmarko-glamor.herokuapp.com/api/products');

    //'http://192.168.12.241:8095/products/all');

    final productsResponse = await requestResult.getData();

    productsResponse["products"].forEach((product) {
      _products.add(
        Product(
          id: product['id'],
          name: product['name'],
          price: product['price'].toDouble(),
          rating: product['rating'].toDouble(),
          images: buildImagesList(product['image']),
          description: product['description'],
          countInStock: product['countInStock'],
          reviews: product['reviews'],
          numReviews: product['numReviews'],
          colors: buildColorList(product['colors']),
          total: 0,
        ),
      );
    });

    notifyListeners();
  }

  get products => _products;

  Future getTopProducts() async {
    RequestResult requestResult = RequestResult(
        'https://lukovicmarko-glamor.herokuapp.com/api/products/top');
    var productsResponse = await requestResult.getData();

    productsResponse.forEach((product) {
      _topProducts.add(
        Product(
          id: product['_id'],
          name: product['name'],
          price: product['price'].toDouble(),
          rating: product['rating'].toDouble(),
          images: buildImagesList(product['image']),
          description: product['description'],
          countInStock: product['countInStock'],
          reviews: product['reviews'],
          numReviews: product['numReviews'],
          colors: buildColorList(product['colors']),
          total: 1,
        ),
      );
    });

    notifyListeners();
  }

  buildImagesList(images) {
    List imagesList = [];
    images.forEach((image) {
      imagesList.add(image);
    });
    return imagesList;
  }

  buildColorList(colors) {
    List colorList = [];
    colors.forEach((color) {
      colorList.add(color);
    });
    return colorList;
  }

  int _imageIndex = 0;

  set imageIndex(index) {
    _imageIndex = index;
    notifyListeners();
  }

  get imageIndex => _imageIndex;

  get topProducts => _topProducts;
}
