import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:portfolio_website/home_page/home_page.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/utils/static_text.dart';
import 'package:portfolio_website/widgets/landscape_header.dart';
import 'package:portfolio_website/widgets/portrait_header.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:scroll_animator/scroll_animator.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  static const String routeName = '/resume';

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
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
          StaticText.blog,
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

  Widget _buildSection({
    required String title,
    required List<Widget> children,
    required int delay,
  }) {
    return SlideInLeft(
      config: BaseAnimationConfig(
        delay: Duration(milliseconds: delay),
        child: Container(
          margin: EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: context.customColors.gunMetal,
                ),
              ),
              SizedBox(height: 16),
              ...children,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceItem({
    required String title,
    required String company,
    required String period,
    required String location,
    required List<String> achievements,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: context.customColors.gunMetal,
                      ),
                    ),
                    Text(
                      company,
                      style: TextStyle(
                        fontSize: 16,
                        color: context.customColors.cadetGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    period,
                    style: TextStyle(
                      fontSize: 14,
                      color: context.customColors.cadetGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 14,
                      color: context.customColors.cadetGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          ...achievements.map((achievement) => Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8, right: 8),
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: context.customColors.cadetGrey,
                    shape: BoxShape.circle,
                  ),
                ),
                Expanded(
                  child: Text(
                    achievement,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }

  Widget _buildEducationItem({
    required String degree,
    required String institution,
    required String period,
    required String location,
    String? grade,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  degree,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: context.customColors.gunMetal,
                  ),
                ),
                Text(
                  institution,
                  style: TextStyle(
                    fontSize: 16,
                    color: context.customColors.cadetGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (grade != null)
                  Text(
                    grade,
                    style: TextStyle(
                      fontSize: 14,
                      color: context.customColors.cadetGrey,
                    ),
                  ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                period,
                style: TextStyle(
                  fontSize: 14,
                  color: context.customColors.cadetGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                location,
                style: TextStyle(
                  fontSize: 14,
                  color: context.customColors.cadetGrey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory({
    required String category,
    required List<String> skills,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: context.customColors.gunMetal,
            ),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills.map((skill) => Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: context.customColors.cadetGrey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                skill,
                style: TextStyle(
                  fontSize: 14,
                  color: context.customColors.gunMetal,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )).toList(),
          ),
        ],
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
                child: Container(
                  constraints: BoxConstraints(maxWidth: 900),
                  child: Column(
                    children: [
                      SlideInLeft(
                        config: BaseAnimationConfig(
                          delay: 200.ms,
                          child: Text(
                            "Resume",
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
                            "Software Developer with expertise in full-stack development and mobile applications",
                            style: TextStyle(
                              fontSize: 18,
                              color: context.customColors.cadetGrey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      
                      // Download Resume Button
                      SlideInLeft(
                        config: BaseAnimationConfig(
                          delay: 600.ms,
                          child: GestureDetector(
                            onTap: () => print("Download Resume"),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                decoration: BoxDecoration(
                                  color: context.customColors.gunMetal,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.download, color: context.customColors.dutchWhite),
                                    SizedBox(width: 8),
                                    Text(
                                      "Download PDF",
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
                        ),
                      ),
                      
                      SizedBox(height: 48),
                      
                      // Professional Experience
                      _buildSection(
                        title: "Professional Experience",
                        delay: 800,
                        children: [
                          _buildExperienceItem(
                            title: "Senior Software Developer",
                            company: "Tech Innovations Ltd",
                            period: "2022 - Present",
                            location: "Remote",
                            achievements: [
                              "Led development of cross-platform mobile applications using Flutter, reaching 10,000+ active users",
                              "Architected and implemented REST APIs using FastAPI and Python, handling 1M+ requests daily",
                              "Mentored junior developers and established coding standards that improved team productivity by 30%",
                              "Collaborated with UX/UI designers to create intuitive user interfaces for complex applications",
                            ],
                          ),
                          _buildExperienceItem(
                            title: "Full Stack Developer",
                            company: "Digital Solutions Inc",
                            period: "2021 - 2022",
                            location: "Hybrid",
                            achievements: [
                              "Developed responsive web applications using JavaScript, React, and Node.js",
                              "Integrated third-party APIs and services to enhance application functionality",
                              "Optimized application performance resulting in 40% faster load times",
                              "Implemented automated testing procedures reducing bug reports by 50%",
                            ],
                          ),
                          _buildExperienceItem(
                            title: "Software Developer Intern",
                            company: "StartUp Ventures",
                            period: "2020 - 2021",
                            location: "On-site",
                            achievements: [
                              "Built desktop applications using Python and GUI frameworks",
                              "Participated in code reviews and gained experience with version control systems",
                              "Contributed to open-source projects and improved documentation",
                              "Assisted in database design and optimization for improved query performance",
                            ],
                          ),
                        ],
                      ),
                      
                      // Education
                      _buildSection(
                        title: "Education",
                        delay: 1000,
                        children: [
                          _buildEducationItem(
                            degree: "Master of Science in Computer Science",
                            institution: "University of Technology",
                            period: "2021 - 2023",
                            location: "India",
                            grade: "First Class with Distinction",
                          ),
                          _buildEducationItem(
                            degree: "Bachelor of Computer Applications",
                            institution: "College of Technology",
                            period: "2018 - 2021",
                            location: "India",
                            grade: "First Class",
                          ),
                        ],
                      ),
                      
                      // Technical Skills
                      _buildSection(
                        title: "Technical Skills",
                        delay: 1200,
                        children: [
                          _buildSkillCategory(
                            category: "Programming Languages",
                            skills: ["Python", "Dart", "JavaScript", "TypeScript", "C++", "Java", "C#"],
                          ),
                          _buildSkillCategory(
                            category: "Frameworks & Libraries",
                            skills: ["Flutter", "React", "Node.js", "FastAPI", "Django", "Flask"],
                          ),
                          _buildSkillCategory(
                            category: "Tools & Technologies",
                            skills: ["Git", "Docker", "Linux", "Firebase", "REST APIs", "JSON", "XML"],
                          ),
                          _buildSkillCategory(
                            category: "Databases",
                            skills: ["PostgreSQL", "MongoDB", "SQLite", "MySQL"],
                          ),
                          _buildSkillCategory(
                            category: "Other Skills",
                            skills: ["Mobile Development", "Web Development", "API Design", "UI/UX Design", "Agile Development"],
                          ),
                        ],
                      ),
                      
                      // Achievements
                      _buildSection(
                        title: "Key Achievements",
                        delay: 1400,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                "🌟 GUI YouTube Downloader: 120+ GitHub stars, 10+ forks",
                                "📱 Built and deployed multiple cross-platform mobile applications",
                                "🔧 Created efficient APIs serving millions of requests",
                                "📚 Contributed to open-source projects with focus on developer tools",
                                "🎯 Demonstrated expertise across multiple programming paradigms",
                              ].map((achievement) => Padding(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        achievement,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black87,
                                          height: 1.4,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )).toList(),
                            ),
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}