import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key, required this.height, required this.width});

  final double height;
  final double width;

  Widget _buildProjectCard({
    required BuildContext context,
    required String title,
    required String description,
    required List<String> technologies,
    required String githubUrl,
    String? liveUrl,
    required int stars,
    required int delay,
  }) {
    return SlideInLeft(
      config: BaseAnimationConfig(
        delay: Duration(milliseconds: delay),
        child: Container(
          margin: EdgeInsets.only(bottom: 24),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
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
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        stars.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: context.customColors.cadetGrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
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
              SizedBox(height: 20),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => _launchUrl(githubUrl),
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
                            Icon(Icons.code, color: Colors.white, size: 16),
                            SizedBox(width: 8),
                            Text(
                              'GitHub',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
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
                      onTap: () => _launchUrl(liveUrl),
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
                                'Live Demo',
                                style: TextStyle(
                                  color: context.customColors.gunMetal,
                                  fontWeight: FontWeight.w500,
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

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: context.customColors.cadetGrey.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
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
                    color: context.customColors.gunMetal,
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
                  "A showcase of my favorite projects and contributions",
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
                    context: context,
                    title: "GUI YouTube Downloader",
                    description: "A cross-platform Python application with a modern GUI for downloading YouTube videos. Features include multiple format options, playlist support, and progress tracking.",
                    technologies: ["Python", "tkinter", "yt-dlp", "GUI"],
                    githubUrl: "https://github.com/ShalmonAnandas/GUI-YouTube-Downloader",
                    stars: 120,
                    delay: 600,
                  ),
                  _buildProjectCard(
                    context: context,
                    title: "Books API",
                    description: "A FastAPI-based RESTful service for library management. Features include book search, user authentication, borrowing system, and comprehensive documentation.",
                    technologies: ["Python", "FastAPI", "SQLAlchemy", "PostgreSQL"],
                    githubUrl: "https://github.com/ShalmonAnandas/books-api",
                    stars: 15,
                    delay: 800,
                  ),
                  _buildProjectCard(
                    context: context,
                    title: "0.1 + 0.2 != 0.3",
                    description: "Multi-language demonstration of floating point arithmetic quirks. Educational project showing IEEE 754 precision issues across Python, JavaScript, and C++.",
                    technologies: ["Python", "JavaScript", "C++", "Education"],
                    githubUrl: "https://github.com/ShalmonAnandas/0.1-0.2-0.3",
                    liveUrl: "https://floating-point-demo.vercel.app",
                    stars: 8,
                    delay: 1000,
                  ),
                  _buildProjectCard(
                    context: context,
                    title: "Movie App",
                    description: "A Flutter mobile application for browsing movies and TV shows. Features include search functionality, detailed movie information, and personalized recommendations.",
                    technologies: ["Flutter", "Dart", "REST API", "Mobile"],
                    githubUrl: "https://github.com/ShalmonAnandas/movie-app",
                    stars: 25,
                    delay: 1200,
                  ),
                  _buildProjectCard(
                    context: context,
                    title: "Interactive Games Collection",
                    description: "A collection of web-based interactive games including puzzle games, arcade-style games, and brain teasers built with modern web technologies.",
                    technologies: ["JavaScript", "HTML5", "CSS3", "Canvas"],
                    githubUrl: "https://github.com/ShalmonAnandas/interactive-games",
                    liveUrl: "https://shalmon-games.vercel.app",
                    stars: 12,
                    delay: 1400,
                  ),
                  _buildProjectCard(
                    context: context,
                    title: "Emotions & TechTips",
                    description: "Personal blog website focusing on technology insights and emotional intelligence in the tech industry. Built with modern web frameworks and responsive design.",
                    technologies: ["Next.js", "React", "TypeScript", "Vercel"],
                    githubUrl: "https://github.com/ShalmonAnandas/emotions-and-tech-tips",
                    liveUrl: "https://emotions-and-tech-tips.vercel.app",
                    stars: 5,
                    delay: 1600,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}