import 'package:flutter/material.dart';
import 'package:food/src/data/products_data.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/provider/spinner.dart';
import 'package:food/src/screens/splash/splash_screen.dart';
import 'package:food/src/utils/routes.dart';
import 'package:food/src/utils/theme.dart';
import 'package:provider/provider.dart';
import 'data/auth_data.dart';
import 'data/banners_data.dart';

class Glamor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          builder: (context) => ProductsData(),
        ),
        ChangeNotifierProvider(
          builder: (context) => AuthData(),
        ),
        ChangeNotifierProvider(
          builder: (context) => Spinner(),
        ),
        ChangeNotifierProvider(
          builder: (context) => BannersData(),
        ),
      ],
      child: MaterialApp(
        title: 'ProShop',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
