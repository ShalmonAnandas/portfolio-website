import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_website/details_page.dart';
import 'package:portfolio_website/utils/animated_route.dart';
import 'package:portfolio_website/utils/static_text.dart';
import 'package:portfolio_website/widgets/landscape_header.dart';
import 'package:portfolio_website/widgets/portrait_header.dart';
import 'package:scroll_animator/scroll_animator.dart';
import 'utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _scrollController;
  bool _hasNavigated = false;
  late List<Widget> ctaList = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        StaticText.aboutMe,
        style: TextStyle(
          color: context.customColors.dutchWhite,
          fontSize: 16,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        StaticText.resume,
        style: TextStyle(
          color: context.customColors.dutchWhite,
          fontSize: 16,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        StaticText.myProjects,
        style: TextStyle(
          color: context.customColors.dutchWhite,
          fontSize: 16,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
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
      if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse &&
          !_hasNavigated) {
        _hasNavigated = true;
        Navigator.of(context).push(animatedRoute(DetailsPage())).then((_) {
          _hasNavigated = false;
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
          child: Column(
            children: ctaList,
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
                  )
                : PortraitHeader(height: height, width: width)
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
        ),
        Container(
          height: height * 0.2,
          width: width,
          decoration: BoxDecoration(
            color: context.customColors.dutchWhite,
          ),
        )
      ],
    );
  }
}
