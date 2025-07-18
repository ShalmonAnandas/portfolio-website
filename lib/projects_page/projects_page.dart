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

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  static const String routeName = '/projects';

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
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
        onTap: () => QR.popUntilOrPush('/aboutme'),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.aboutMe,
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

  Widget _buildProjectCard({
    required String title,
    required String description,
    required List<String> technologies,
    required String githubUrl,
    String? liveUrl,
    required String stars,
    required Color cardColor,
    required int delay,
  }) {
    return SlideInLeft(
      config: BaseAnimationConfig(
        delay: Duration(milliseconds: delay),
        child: Container(
          margin: EdgeInsets.only(bottom: 24),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: context.customColors.gunMetal,
                      ),
                    ),
                  ),
                  if (stars.isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: context.customColors.gunMetal,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text(
                            stars,
                            style: TextStyle(
                              color: context.customColors.dutchWhite,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: technologies
                    .map((tech) => Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: context.customColors.cadetGrey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            tech,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: context.customColors.gunMetal,
                            ),
                          ),
                        ))
                    .toList(),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => print("Open GitHub: $githubUrl"),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: context.customColors.gunMetal,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.code, color: context.customColors.dutchWhite, size: 16),
                            SizedBox(width: 8),
                            Text(
                              "GitHub",
                              style: TextStyle(
                                color: context.customColors.dutchWhite,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (liveUrl != null) ...[
                    SizedBox(width: 12),
                    GestureDetector(
                      onTap: () => print("Open Live: $liveUrl"),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: context.customColors.gunMetal),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.launch, color: context.customColors.gunMetal, size: 16),
                              SizedBox(width: 8),
                              Text(
                                "Live Demo",
                                style: TextStyle(
                                  color: context.customColors.gunMetal,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
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
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    SlideInLeft(
                      config: BaseAnimationConfig(
                        delay: 200.ms,
                        child: Text(
                          "My Projects",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SlideInLeft(
                      config: BaseAnimationConfig(
                        delay: 400.ms,
                        child: Text(
                          "A collection of projects that showcase my skills and passion for development",
                          style: TextStyle(
                            fontSize: 18,
                            color: context.customColors.cadetGrey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 48),
                    Container(
                      constraints: BoxConstraints(maxWidth: 1000),
                      child: Column(
                        children: [
                          _buildProjectCard(
                            title: "GUI YouTube Downloader",
                            description: "A cross-platform GUI application for youtube-dl written entirely in Python using the WX library. Features include video quality selection, playlist support, and batch downloads.",
                            technologies: ["Python", "WX Library", "FFmpeg", "Cross-platform"],
                            githubUrl: "https://github.com/ShalmonAnandas/Gui-Youtube-dl",
                            stars: "120",
                            cardColor: Colors.white,
                            delay: 600,
                          ),
                          _buildProjectCard(
                            title: "Books API",
                            description: "A simple and efficient API to fetch books from Libgen using FastAPI. Provides search functionality and book metadata retrieval with clean REST endpoints.",
                            technologies: ["Python", "FastAPI", "Web Scraping", "REST API"],
                            githubUrl: "https://github.com/ShalmonAnandas/books-api",
                            liveUrl: "https://books-api-mauve.vercel.app",
                            stars: "1",
                            cardColor: context.customColors.cadetGrey.withOpacity(0.1),
                            delay: 800,
                          ),
                          _buildProjectCard(
                            title: "Emotions & Tech Tips Blog",
                            description: "A personal blog website built with HTML/CSS/JavaScript focusing on technology tips and emotional intelligence in the tech industry.",
                            technologies: ["HTML", "CSS", "JavaScript", "Responsive Design"],
                            githubUrl: "https://github.com/ShalmonAnandas/Emotions-and-TechTips",
                            liveUrl: "https://emotions-and-tech-tips.vercel.app",
                            stars: "2",
                            cardColor: Colors.white,
                            delay: 1000,
                          ),
                          _buildProjectCard(
                            title: "0.1 + 0.2 != 0.3",
                            description: "Fascinated by floating point arithmetic, this repository demonstrates that 0.1+0.2!=0.3 in every programming language, exploring IEEE 754 standard implementations.",
                            technologies: ["Multiple Languages", "Computer Science", "IEEE 754"],
                            githubUrl: "https://github.com/ShalmonAnandas/0.1-plus-0.2",
                            stars: "1",
                            cardColor: context.customColors.cadetGrey.withOpacity(0.1),
                            delay: 1200,
                          ),
                          _buildProjectCard(
                            title: "Movie App",
                            description: "A Flutter-based movie application that allows users to browse movies, view details, and manage their watchlist with a clean, modern interface.",
                            technologies: ["Flutter", "Dart", "API Integration", "Mobile UI"],
                            githubUrl: "https://github.com/ShalmonAnandas/movie_app",
                            liveUrl: "https://movie-app-beta-khaki.vercel.app",
                            stars: "2",
                            cardColor: Colors.white,
                            delay: 1400,
                          ),
                          _buildProjectCard(
                            title: "Interactive Game Collection",
                            description: "A collection of web-based interactive games including Sudoku solver, Secret Hitler board game implementation, and AI-powered story games.",
                            technologies: ["Dart", "JavaScript", "TypeScript", "Game Logic"],
                            githubUrl: "https://github.com/ShalmonAnandas/sudoku",
                            stars: "1",
                            cardColor: context.customColors.cadetGrey.withOpacity(0.1),
                            delay: 1600,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 48),
                    SlideInLeft(
                      config: BaseAnimationConfig(
                        delay: 1800.ms,
                        child: Container(
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: context.customColors.gunMetal,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Want to see more?",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: context.customColors.dutchWhite,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Check out my GitHub for more projects and contributions",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: context.customColors.dutchWhite,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () => print("Open GitHub Profile"),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                    decoration: BoxDecoration(
                                      color: context.customColors.dutchWhite,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.open_in_new, color: context.customColors.gunMetal),
                                        SizedBox(width: 8),
                                        Text(
                                          "View GitHub Profile",
                                          style: TextStyle(
                                            color: context.customColors.gunMetal,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}