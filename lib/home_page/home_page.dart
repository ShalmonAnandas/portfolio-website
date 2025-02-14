import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_website/about_me_page/about_me_page.dart';
import 'package:portfolio_website/home_page/home_page_content.dart';
import 'package:portfolio_website/utils/assets.dart';
import 'package:portfolio_website/utils/static_text.dart';
import 'package:portfolio_website/widgets/landscape_header.dart';
import 'package:portfolio_website/widgets/portrait_header.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:scroll_animator/scroll_animator.dart';
import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  late List<Widget> ctaList = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => QR.popUntilOrPush(AboutMePage.routeName),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.aboutMe,
            style: TextStyle(
              color: context.customColors.dutchWhite,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          StaticText.resume,
          style: TextStyle(
            color: context.customColors.dutchWhite,
            fontSize: 16,
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          StaticText.myProjects,
          style: TextStyle(
            color: context.customColors.dutchWhite,
            fontSize: 16,
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          StaticText.blog,
          style: TextStyle(
            color: context.customColors.dutchWhite,
            fontSize: 16,
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: GestureDetector(
        onTap: () => print("Shalmon"),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: context.customColors.dutchWhite,
            ),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            child: Text(
              StaticText.getInTouch,
              style: TextStyle(
                color: Colors.black,
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
    _scrollController = AnimatedScrollController(
      animationFactory: const ChromiumImpulse(),
    );
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        QR.to('/aboutme').then((_) {
          _scrollController.animateTo(0,
              duration: Duration(milliseconds: 200), curve: Curves.easeIn);
        });
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {}
    });
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
        child: Stack(
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
            color: context.customColors.gunMetal,
          ),
        ),
        Container(
          height: height * 0.2,
          width: width,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                StaticText.scrollDown,
                style: TextStyle(
                    color: context.customColors.dutchWhite, fontSize: 16),
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
            color: context.customColors.dutchWhite,
          ),
        )
      ],
    );
  }
}
