import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:portfolio_website/home_page/home_page.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/utils/static_text.dart';
import 'package:portfolio_website/widgets/landscape_header.dart';
import 'package:portfolio_website/widgets/portrait_header.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:scroll_animator/scroll_animator.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  static const String routeName = '/blog';

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
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
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
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
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
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
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: GestureDetector(
        onTap: () => print("Get in Touch"),
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

  Widget _buildBlogPost({
    required String title,
    required String excerpt,
    required String date,
    required String readTime,
    required List<String> tags,
    required Color cardColor,
    required int delay,
    String? externalUrl,
  }) {
    return SlideInLeft(
      config: BaseAnimationConfig(
        delay: Duration(milliseconds: delay),
        child: GestureDetector(
          onTap: () => print("Open blog post: $title"),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
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
                      if (externalUrl != null)
                        Icon(
                          Icons.open_in_new,
                          color: context.customColors.cadetGrey,
                          size: 20,
                        ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 14,
                          color: context.customColors.cadetGrey,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        readTime,
                        style: TextStyle(
                          fontSize: 14,
                          color: context.customColors.cadetGrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    excerpt,
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
                    children: tags
                        .map((tag) => Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: context.customColors.cadetGrey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                tag,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: context.customColors.gunMetal,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilter({
    required String category,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected 
                ? context.customColors.gunMetal 
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: context.customColors.gunMetal,
              width: 1,
            ),
          ),
          child: Text(
            category,
            style: TextStyle(
              color: isSelected 
                  ? context.customColors.dutchWhite 
                  : context.customColors.gunMetal,
              fontWeight: FontWeight.w500,
            ),
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
                          "Blog & Articles",
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
                          "Thoughts on technology, development, and the digital world",
                          style: TextStyle(
                            fontSize: 18,
                            color: context.customColors.cadetGrey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    
                    // Category Filters
                    SlideInLeft(
                      config: BaseAnimationConfig(
                        delay: 600.ms,
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          alignment: WrapAlignment.center,
                          children: [
                            _buildCategoryFilter(
                              category: "All",
                              isSelected: true,
                              onTap: () {},
                            ),
                            _buildCategoryFilter(
                              category: "Technology",
                              isSelected: false,
                              onTap: () {},
                            ),
                            _buildCategoryFilter(
                              category: "Development",
                              isSelected: false,
                              onTap: () {},
                            ),
                            _buildCategoryFilter(
                              category: "Tutorials",
                              isSelected: false,
                              onTap: () {},
                            ),
                            _buildCategoryFilter(
                              category: "Personal",
                              isSelected: false,
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 48),
                    Container(
                      constraints: BoxConstraints(maxWidth: 800),
                      child: Column(
                        children: [
                          _buildBlogPost(
                            title: "Building Cross-Platform Apps with Flutter: Lessons Learned",
                            excerpt: "After developing several Flutter applications, here are the key insights and best practices I've discovered for creating efficient, maintainable cross-platform mobile apps.",
                            date: "March 15, 2024",
                            readTime: "8 min read",
                            tags: ["Flutter", "Mobile Development", "Cross-Platform"],
                            cardColor: Colors.white,
                            delay: 800,
                          ),
                          _buildBlogPost(
                            title: "The Art of API Design: Creating Developer-Friendly Interfaces",
                            excerpt: "Good API design is crucial for developer experience. This article explores principles and patterns for building APIs that are intuitive, consistent, and easy to use.",
                            date: "February 28, 2024",
                            readTime: "6 min read",
                            tags: ["API Design", "Backend Development", "Best Practices"],
                            cardColor: context.customColors.cadetGrey.withOpacity(0.1),
                            delay: 1000,
                          ),
                          _buildBlogPost(
                            title: "Understanding Floating Point Arithmetic: Why 0.1 + 0.2 ≠ 0.3",
                            excerpt: "A deep dive into IEEE 754 standard and why floating point arithmetic can produce unexpected results. Essential knowledge for any programmer working with decimal numbers.",
                            date: "February 10, 2024",
                            readTime: "12 min read",
                            tags: ["Computer Science", "Programming", "Mathematics"],
                            cardColor: Colors.white,
                            delay: 1200,
                          ),
                          _buildBlogPost(
                            title: "From Python to Dart: A Developer's Journey",
                            excerpt: "My experience transitioning from Python development to Flutter and Dart. Comparing syntax, paradigms, and ecosystem differences between these two powerful languages.",
                            date: "January 22, 2024",
                            readTime: "10 min read",
                            tags: ["Python", "Dart", "Programming Languages"],
                            cardColor: context.customColors.cadetGrey.withOpacity(0.1),
                            delay: 1400,
                          ),
                          _buildBlogPost(
                            title: "Emotions and Tech Tips: Building a Personal Blog",
                            excerpt: "The story behind creating my personal blog focusing on technology and emotional intelligence in the tech industry. Technical decisions, design choices, and lessons learned.",
                            date: "December 18, 2023",
                            readTime: "7 min read",
                            tags: ["Web Development", "Personal Project", "Blogging"],
                            cardColor: Colors.white,
                            delay: 1600,
                            externalUrl: "https://emotions-and-tech-tips.vercel.app",
                          ),
                          _buildBlogPost(
                            title: "Open Source Contributions: How to Get Started",
                            excerpt: "A beginner's guide to contributing to open source projects. From finding the right project to making your first pull request, here's everything you need to know.",
                            date: "November 30, 2023",
                            readTime: "9 min read",
                            tags: ["Open Source", "Git", "Community"],
                            cardColor: context.customColors.cadetGrey.withOpacity(0.1),
                            delay: 1800,
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: 48),
                    SlideInLeft(
                      config: BaseAnimationConfig(
                        delay: 2000.ms,
                        child: Container(
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: context.customColors.gunMetal,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Want to read more?",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: context.customColors.dutchWhite,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Check out my external blog for more articles on technology and development",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: context.customColors.dutchWhite,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20),
                              GestureDetector(
                                onTap: () => print("Open external blog"),
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
                                          "Visit External Blog",
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