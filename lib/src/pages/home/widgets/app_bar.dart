import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../../../utils/colors.dart';
import 'dart:convert';

Widget buildAppBar(context) {
  final LocalStorage storage = LocalStorage('localstorage_app');
  Map<String, dynamic> info = json.decode(storage.getItem('info'));

  var name = info["name"].split(" ")[0];

  return AppBar(
    elevation: 0.0,
    titleSpacing: 0.0,
    automaticallyImplyLeading: false,
    title: Text(
      'Welcome, $name',
      style: TextStyle(color: kBlackColor, fontWeight: FontWeight.bold),
    ),
    actions: <Widget>[],
  );
}
