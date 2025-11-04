import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/widgets/animated_on_visible.dart';
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
    required IconData icon,
    required Color iconColor,
  }) {
    return AnimatedOnVisible(
      delay: Duration(milliseconds: delay),
      animationType: AnimationType.fadeInUp,
      child: Container(
        margin: EdgeInsets.only(bottom: 28),
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: iconColor.withOpacity(0.15),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
          border: Border.all(
            color: iconColor.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        iconColor.withOpacity(0.8),
                        iconColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: iconColor.withOpacity(0.3),
                        blurRadius: 12,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: context.customColors.gunMetal,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: context.customColors.warningAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, 
                        color: context.customColors.warningAccent, 
                        size: 18),
                      SizedBox(width: 6),
                      Text(
                        stars.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: context.customColors.warningAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              description,
              style: TextStyle(
                fontSize: 17,
                color: context.customColors.cadetGrey,
                height: 1.7,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: technologies
                  .map((tech) => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: context.customColors.dutchWhite,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: context.customColors.cadetGrey.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          tech,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: context.customColors.gunMetal,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                GestureDetector(
                  onTap: () => _launchUrl(githubUrl),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            context.customColors.gunMetal,
                            context.customColors.gunMetal.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color:
                                context.customColors.gunMetal.withOpacity(0.3),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.code, color: Colors.white, size: 18),
                          SizedBox(width: 10),
                          Text(
                            'View Code',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (liveUrl != null) ...[
                  SizedBox(width: 16),
                  GestureDetector(
                    onTap: () => _launchUrl(liveUrl),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              context.customColors.primaryAccent,
                              context.customColors.secondaryAccent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: context.customColors.primaryAccent.withOpacity(0.3),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.launch, color: Colors.white, size: 18),
                            SizedBox(width: 10),
                            Text(
                              'Live Demo',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
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
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print('Could not launch URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.customColors.dutchWhite,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
        child: Column(
          children: [
            AnimatedOnVisible(
              delay: Duration(milliseconds: 100),
              animationType: AnimationType.fadeInUp,
              child: Text(
                "My Projects",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 48,
                  color: context.customColors.gunMetal,
                  letterSpacing: -1.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            AnimatedOnVisible(
              delay: Duration(milliseconds: 200),
              animationType: AnimationType.fadeIn,
              child: Container(
                height: 4,
                width: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      context.customColors.primaryAccent,
                      context.customColors.secondaryAccent,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 20),
            AnimatedOnVisible(
              delay: Duration(milliseconds: 300),
              animationType: AnimationType.fadeInUp,
              child: Text(
                "A showcase of my favorite projects and contributions",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: context.customColors.cadetGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 60),
            Container(
              constraints: BoxConstraints(maxWidth: 1100),
              child: Column(
                children: [
                  _buildProjectCard(
                    context: context,
                    title: "GUI YouTube Downloader",
                    description:
                        "A cross-platform Python application with a modern GUI for downloading YouTube videos. Features include multiple format options, playlist support, and progress tracking.",
                    technologies: ["Python", "tkinter", "yt-dlp", "GUI"],
                    githubUrl:
                        "https://github.com/ShalmonAnandas/GUI-YouTube-Downloader",
                    stars: 120,
                    delay: 400,
                    icon: Icons.download,
                    iconColor: Colors.red.shade600,
                  ),
                  _buildProjectCard(
                    context: context,
                    title: "Books API",
                    description:
                        "A FastAPI-based RESTful service for library management. Features include book search, user authentication, borrowing system, and comprehensive documentation.",
                    technologies: [
                      "Python",
                      "FastAPI",
                      "SQLAlchemy",
                      "PostgreSQL"
                    ],
                    githubUrl: "https://github.com/ShalmonAnandas/books-api",
                    stars: 15,
                    delay: 450,
                    icon: Icons.menu_book,
                    iconColor: Colors.blue.shade700,
                  ),
                  _buildProjectCard(
                    context: context,
                    title: "0.1 + 0.2 != 0.3",
                    description:
                        "Multi-language demonstration of floating point arithmetic quirks. Educational project showing IEEE 754 precision issues across Python, JavaScript, and C++.",
                    technologies: ["Python", "JavaScript", "C++", "Education"],
                    githubUrl: "https://github.com/ShalmonAnandas/0.1-0.2-0.3",
                    liveUrl: "https://floating-point-demo.vercel.app",
                    stars: 8,
                    delay: 500,
                    icon: Icons.calculate,
                    iconColor: Colors.purple.shade600,
                  ),
                  _buildProjectCard(
                    context: context,
                    title: "Movie App",
                    description:
                        "A Flutter mobile application for browsing movies and TV shows. Features include search functionality, detailed movie information, and personalized recommendations.",
                    technologies: ["Flutter", "Dart", "REST API", "Mobile"],
                    githubUrl: "https://github.com/ShalmonAnandas/movie-app",
                    stars: 25,
                    delay: 550,
                    icon: Icons.movie,
                    iconColor: Colors.orange.shade700,
                  ),
                  _buildProjectCard(
                    context: context,
                    title: "Interactive Games Collection",
                    description:
                        "A collection of web-based interactive games including puzzle games, arcade-style games, and brain teasers built with modern web technologies.",
                    technologies: ["JavaScript", "HTML5", "CSS3", "Canvas"],
                    githubUrl:
                        "https://github.com/ShalmonAnandas/interactive-games",
                    liveUrl: "https://shalmon-games.vercel.app",
                    stars: 12,
                    delay: 600,
                    icon: Icons.sports_esports,
                    iconColor: Colors.green.shade600,
                  ),
                  _buildProjectCard(
                    context: context,
                    title: "Emotions & TechTips",
                    description:
                        "Personal blog website focusing on technology insights and emotional intelligence in the tech industry. Built with modern web frameworks and responsive design.",
                    technologies: ["Next.js", "React", "TypeScript", "Vercel"],
                    githubUrl:
                        "https://github.com/ShalmonAnandas/emotions-and-tech-tips",
                    liveUrl: "https://emotions-and-tech-tips.vercel.app",
                    stars: 5,
                    delay: 650,
                    icon: Icons.article,
                    iconColor: Colors.teal.shade600,
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
