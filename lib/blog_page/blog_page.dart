import 'package:flutter/material.dart';
import 'package:portfolio_website/home_page/home_page.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  static const String routeName = '/blog';

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
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
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      // Navigate back to home after launching
      QR.popUntilOrPush(HomePage.routeName);
    } else {
      // If can't launch, navigate back to home
      QR.popUntilOrPush(HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              'Redirecting to blog...',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}