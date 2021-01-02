import 'package:flutter/material.dart';
import 'package:food/src/models/Category.dart';

final categories = [
  Category(
    id: '1',
    name: 'Man',
    image: 'assets/icons/t-shirt.svg',
    color: [
      Color(0xFFFFB06C),
      Color(0xFFFF8E8C),
    ],
  ),
  Category(
    id: '2',
    name: 'Woman',
    image: 'assets/icons/female-dress.svg',
    color: [
      Color(0xFF9AEDDE),
      Color(0xFF49D291),
    ],
  ),
  Category(
    id: '3',
    name: 'Kids',
    image: 'assets/icons/dress.svg',
    color: [
      Color(0xFF7BCFFE),
      Color(0xFF3CAAF3),
    ],
  ),
];
