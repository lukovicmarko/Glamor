import 'package:flutter/material.dart';

class CheckoutTitle extends StatelessWidget {
  CheckoutTitle({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
