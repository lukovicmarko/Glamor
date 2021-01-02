import 'package:flutter/material.dart';
import 'package:food/src/screens/sign_in/sign_in_screen.dart';
import 'package:food/src/screens/splash/widgets/splash_content.dart';
import 'package:food/src/utils/colors.dart';
import 'package:food/src/utils/constants.dart';
import 'package:food/src/utils/size_config.dart';
import 'package:food/src/widgets/build_dots.dart';
import 'package:food/src/widgets/default_button.dart';
import 'package:localstorage/localstorage.dart';
import '../../main/main_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final LocalStorage storage = LocalStorage('localstorage_app');

  int currentPage = 0;
  PageController controller;

  List<Map<String, String>> splashData = [
    {
      "title": "Choose Your Desire Product",
      "subtitle": "Explore World Top Brands & Grab Them",
      "image": "assets/images/splash_1.png"
    },
    {
      "title": "Complete Your Shopping",
      "subtitle": "Shop Exeptional Modern Clothings \nFor Your Everyday Life",
      "image": "assets/images/splash_2.png"
    },
    {
      "title": "Get Product At Your Door",
      "subtitle": "Transform Your Clothing Styles",
      "image": "assets/images/splash_3.png"
    },
  ];

  void getLocalStorage() {
    final info = storage.getItem('info');

    if (info != null) {
      Navigator.pushNamed(context, MainScreen.routeName);
    } else {
      Navigator.pushNamed(context, SignInScreen.routeName);
    }
  }

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  title: splashData[index]["title"],
                  subtitle: splashData[index]["subtitle"],
                  image: splashData[index]["image"],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                    ),
                    child: currentPage == 2
                        ? DefaultButton(
                            text: 'Get Started',
                            onPress: () {
                              Navigator.pushNamed(
                                  context, SignInScreen.routeName);
                            },
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  getLocalStorage();
                                },
                                child: Text('Skip'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  splashData.length,
                                  (index) => buildDots(
                                    currentIndex: currentPage,
                                    index: index,
                                    color: kRedColor,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentPage++;
                                    if (controller.hasClients) {
                                      controller.animateToPage(
                                        currentPage,
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  });
                                },
                                child: Text('Next'),
                              )
                            ],
                          ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
