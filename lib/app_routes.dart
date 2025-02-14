import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:portfolio_website/about_me_page/about_me_page.dart';
import 'package:portfolio_website/home_page/home_page.dart';

class AppRoutes {
  static String homePage = 'Home Page';
  static String aboutMePage = 'About Me Page';

  final routes = [
    QRoute(
      name: homePage,
      path: HomePage.routeName,
      builder: () => HomePage(),
      pageType: slideTransitionPage,
    ),
    QRoute(
      name: aboutMePage,
      path: AboutMePage.routeName,
      builder: () => AboutMePage(),
      pageType: slideTransitionPage,
    )
  ];
}

QCustomPage get slideTransitionPage => QCustomPage(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInCubic;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
