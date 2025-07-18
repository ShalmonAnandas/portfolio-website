import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:portfolio_website/about_me_page/about_me_page.dart';
import 'package:portfolio_website/home_page/home_page.dart';
import 'package:portfolio_website/projects_page/projects_page.dart';
import 'package:portfolio_website/resume_page/resume_page.dart';
import 'package:portfolio_website/blog_page/blog_page.dart';
import 'package:portfolio_website/contact_page/contact_page.dart';

class AppRoutes {
  static String homePage = 'Home Page';
  static String aboutMePage = 'About Me Page';
  static String projectsPage = 'Projects Page';
  static String resumePage = 'Resume Page';
  static String blogPage = 'Blog Page';
  static String contactPage = 'Contact Page';

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
    ),
    QRoute(
      name: projectsPage,
      path: ProjectsPage.routeName,
      builder: () => ProjectsPage(),
      pageType: slideTransitionPage,
    ),
    QRoute(
      name: resumePage,
      path: ResumePage.routeName,
      builder: () => ResumePage(),
      pageType: slideTransitionPage,
    ),
    QRoute(
      name: blogPage,
      path: BlogPage.routeName,
      builder: () => BlogPage(),
      pageType: slideTransitionPage,
    ),
    QRoute(
      name: contactPage,
      path: ContactPage.routeName,
      builder: () => ContactPage(),
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
