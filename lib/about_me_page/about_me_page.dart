import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:portfolio_website/home_page/home_page.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/utils/static_text.dart';
import 'package:portfolio_website/widgets/landscape_header.dart';
import 'package:portfolio_website/widgets/portrait_header.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:scroll_animator/scroll_animator.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  static const String routeName = '/aboutme';

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  late final ScrollController _scrollController;

  late List<Widget> ctaList = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => QR.popUntilOrPush(HomePage.routeName),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.home,
            style: TextStyle(
              color: context.customColors.gunMetal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => QR.popUntilOrPush('/resume'),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.resume,
            style: TextStyle(
              color: context.customColors.gunMetal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => QR.popUntilOrPush('/projects'),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.myProjects,
            style: TextStyle(
              color: context.customColors.gunMetal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => QR.popUntilOrPush('/blog'),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.blog,
            style: TextStyle(
              color: context.customColors.gunMetal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: GestureDetector(
        onTap: () => QR.popUntilOrPush('/contact'),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: context.customColors.gunMetal,
            ),
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
            child: Text(
              StaticText.getInTouch,
              style: TextStyle(
                color: context.customColors.dutchWhite,
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
    _scrollController = AnimatedScrollController(
      animationFactory: const ChromiumImpulse(),
    );
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == 0) {
        QR.back();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(MediaQuery.of(context).size.height * 0.1,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    });
    super.initState();
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: context.customColors.gunMetal,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: context.customColors.dutchWhite,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildExperienceCard(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: context.customColors.gunMetal,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: context.customColors.cadetGrey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          height: height * 1.1,
          width: width,
          decoration: BoxDecoration(
            color: context.customColors.dutchWhite,
          ),
          child: Column(
            children: [
              SizedBox(height: height * 0.1),
              (MediaQuery.of(context).size.aspectRatio > 0.8)
                  ? LandscapeHeader(
                      height: height,
                      width: width,
                      ctaList: ctaList,
                      headerColor: context.customColors.gunMetal,
                    )
                  : PortraitHeader(
                      height: height,
                      width: width,
                      headerColor: context.customColors.gunMetal,
                    ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      SlideInLeft(
                        config: BaseAnimationConfig(
                          delay: 200.ms,
                          child: Text(
                            "Hi, I'm Shalmon Anandas",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      SlideInLeft(
                        config: BaseAnimationConfig(
                          delay: 400.ms,
                          child: Text(
                            "Software Developer & Computer Science Graduate",
                            style: TextStyle(
                                fontSize: 24,
                                color: context.customColors.cadetGrey,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      SlideInLeft(
                        config: BaseAnimationConfig(
                          delay: 600.ms,
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 800),
                            child: Text(
                              "I'm a passionate software developer with a Master's degree in Computer Science, specializing in full-stack development, mobile applications, and API design. With expertise in Python, Dart/Flutter, JavaScript, and C++, I love creating innovative solutions that solve real-world problems.\n\nMy journey in technology spans across diverse projects from GUI applications and web development to bioinformatics tools and interactive games. I'm particularly interested in creating user-friendly applications that bridge the gap between complex technology and everyday users.",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  height: 1.6),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      SlideInLeft(
                        config: BaseAnimationConfig(
                          delay: 800.ms,
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 16,
                            runSpacing: 12,
                            children: [
                              _buildSkillChip("Python"),
                              _buildSkillChip("Dart/Flutter"),
                              _buildSkillChip("JavaScript"),
                              _buildSkillChip("TypeScript"),
                              _buildSkillChip("C++"),
                              _buildSkillChip("Java"),
                              _buildSkillChip("FastAPI"),
                              _buildSkillChip("React"),
                              _buildSkillChip("Node.js"),
                              _buildSkillChip("Git"),
                              _buildSkillChip("Linux"),
                              _buildSkillChip("Docker"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      SlideInLeft(
                        config: BaseAnimationConfig(
                          delay: 1000.ms,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildExperienceCard("3+", "Years Experience"),
                              SizedBox(width: 24),
                              _buildExperienceCard("15+", "Projects"),
                              SizedBox(width: 24),
                              _buildExperienceCard("120+", "GitHub Stars"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
