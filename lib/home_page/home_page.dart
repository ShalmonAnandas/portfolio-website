import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_website/home_page/home_page_content.dart';
import 'package:portfolio_website/home_page/sections/about_section.dart';
import 'package:portfolio_website/home_page/sections/projects_section.dart';
import 'package:portfolio_website/home_page/sections/work_experience_section.dart';
import 'package:portfolio_website/utils/assets.dart';
import 'package:portfolio_website/utils/static_text.dart';
import 'package:portfolio_website/widgets/landscape_header.dart';
import 'package:portfolio_website/widgets/portrait_header.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _resumeKey = GlobalKey();
  
  late List<Widget> ctaList = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => _scrollToSection(_aboutKey),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.aboutMe,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => _scrollToSection(_projectsKey),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.myProjects,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => _scrollToSection(_resumeKey),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.resume,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => _launchExternalBlog(),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.blog,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: GestureDetector(
        onTap: () => _launchExternalContact(),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [
                  context.customColors.primaryAccent,
                  context.customColors.secondaryAccent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: context.customColors.primaryAccent.withOpacity(0.3),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              StaticText.getInTouch,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _launchExternalBlog() async {
    final Uri url = Uri.parse('https://www.shalmon.blog/');
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print('Could not launch blog URL: $e');
    }
  }

  Future<void> _launchExternalContact() async {
    final Uri url = Uri.parse('mailto:shalmon@example.com');
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print('Could not launch contact URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        width: width * 0.7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Container(
          height: height,
          width: width * 0.8,
          decoration: BoxDecoration(
            color: context.customColors.gunMetal,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 32, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ctaList,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Home Section
            Stack(
              children: [
                HomePageBackground(height: height, width: width),
                (MediaQuery.of(context).size.aspectRatio > 0.8)
                    ? LandscapeHeader(
                        height: height,
                        width: width,
                        ctaList: ctaList,
                        headerColor: context.customColors.dutchWhite,
                      )
                    : PortraitHeader(
                        height: height,
                        width: width,
                        headerColor: context.customColors.dutchWhite,
                      ),
                HomePageContent(height: height, width: width)
              ],
            ),
            // About Section
            Container(
              key: _aboutKey,
              child: AboutSection(height: height, width: width),
            ),
            // Projects Section
            Container(
              key: _projectsKey,
              child: ProjectsSection(height: height, width: width),
            ),
            // Work Experience Section
            Container(
              key: _resumeKey,
              child: WorkExperienceSection(height: height, width: width),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageBackground extends StatelessWidget {
  const HomePageBackground({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height * 0.8,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.customColors.gunMetal,
                context.customColors.gunMetal.withOpacity(0.95),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Container(
          height: height * 0.2,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.customColors.gunMetal.withOpacity(0.95),
                context.customColors.gunMetal,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StaticText.scrollDown,
                style: TextStyle(
                    color: Colors.white, 
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Text(
                "Discover more about me",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), 
                    fontSize: 15),
              ),
              Lottie.asset(
                Assets.scrollDownAnim,
                height: 50,
                width: 50,
              )
            ],
          ),
        ),
        Container(
          height: height * 0.1,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.customColors.gunMetal,
                context.customColors.dutchWhite,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        )
      ],
    );
  }
}
