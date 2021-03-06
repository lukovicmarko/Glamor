import 'package:flutter/material.dart';
import 'package:food/src/data/cart_data.dart';
import 'package:food/src/data/products_data.dart';
import 'package:food/src/provider/bottomNavigationProvider.dart';
import 'package:food/src/provider/spinner.dart';
import 'package:food/src/screens/main/main_screen.dart';
import 'package:food/src/screens/splash/splash_screen.dart';
import 'package:food/src/utils/routes.dart';
import 'package:food/src/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer_util.dart';
import 'data/auth_data.dart';

class Glamor extends StatelessWidget {
  Glamor({this.token});
  final String token;
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
          builder: (context) => CartData(),
        ),
        ChangeNotifierProvider(
          builder: (context) => AuthData(),
        ),
        ChangeNotifierProvider(
          builder: (context) => Spinner(),
        ),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              SizerUtil().init(constraints, orientation);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Glamor',
                theme: theme(),
                initialRoute: token == null
                    ? SplashScreen.routeName
                    : MainScreen.routeName,
                routes: routes,
              );
            },
          );
        },
      ),
    );
  }
}
