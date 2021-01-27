import 'package:flutter/material.dart';
import 'package:food/src/utils/colors.dart';

class CardType extends StatefulWidget {
  @override
  _CardTypeState createState() => _CardTypeState();
}

class _CardTypeState extends State<CardType> {
  int currentIndex = 0;

  final List paymentCards = [
    "assets/images/visa.png",
    "assets/images/mastercard.png",
    "assets/images/american.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: paymentCards.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Container(
              height: 50,
              width: 80,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: currentIndex == index ? kRedColor : kLightGrey,
                ),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Image.asset(paymentCards[index]),
            ),
          );
        },
      ),
    );
  }
}
