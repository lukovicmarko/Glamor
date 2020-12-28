import 'package:flutter/material.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/screens/main/widgets/body.dart';
import 'package:food/src/screens/main/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  static String routeName = "/main";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: Body(provider),
      bottomNavigationBar: buildBottomNavigationBar(provider),
    );
  }
}
