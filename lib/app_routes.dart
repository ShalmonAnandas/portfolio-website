import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:portfolio_website/home_page/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class AppRoutes {
  static String homePage = 'Home Page';
  static String blogPage = 'Blog Page';

  final routes = [
    QRoute(
      name: homePage,
      path: HomePage.routeName,
      builder: () => HomePage(),
      pageType: slideTransitionPage,
    ),
    QRoute(
      name: blogPage,
      path: '/blog',
      builder: () => BlogRedirectPage(),
      pageType: slideTransitionPage,
    ),
  ];
}

// Simple blog redirect page that immediately redirects to external blog
class BlogRedirectPage extends StatefulWidget {
  const BlogRedirectPage({super.key});

  @override
  State<BlogRedirectPage> createState() => _BlogRedirectPageState();
}

class _BlogRedirectPageState extends State<BlogRedirectPage> {
  @override
  void initState() {
    super.initState();
    // Redirect to external blog immediately
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _launchExternalBlog();
    });
  }

  Future<void> _launchExternalBlog() async {
    final Uri url = Uri.parse('https://www.shalmon.blog/');
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      // If launch fails, just go back to home
      print('Could not launch blog URL: $e');
    }
    // Navigate back to home
    if (mounted) {
      QR.popUntilOrPush(HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
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
