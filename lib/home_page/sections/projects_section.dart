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
    bool isMobile = false,
  }) {
    return AnimatedOnVisible(
      delay: Duration(milliseconds: delay),
      animationType: AnimationType.fadeInUp,
      child: Container(
        margin: EdgeInsets.only(bottom: isMobile ? 20 : 28),
        padding: EdgeInsets.all(isMobile ? 20 : 28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(isMobile ? 16 : 14),
          boxShadow: [
            BoxShadow(
              color: iconColor.withOpacity(0.12),
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
          border: Border.all(
            color: iconColor.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: isMobile
            ? _buildMobileLayout(
                context: context,
                title: title,
                description: description,
                technologies: technologies,
                githubUrl: githubUrl,
                liveUrl: liveUrl,
                stars: stars,
                icon: icon,
                iconColor: iconColor,
              )
            : _buildDesktopLayout(
                context: context,
                title: title,
                description: description,
                technologies: technologies,
                githubUrl: githubUrl,
                liveUrl: liveUrl,
                stars: stars,
                icon: icon,
                iconColor: iconColor,
              ),
      ),
    );
  }

  Widget _buildDesktopLayout({
    required BuildContext context,
    required String title,
    required String description,
    required List<String> technologies,
    required String githubUrl,
    String? liveUrl,
    required int stars,
    required IconData icon,
    required Color iconColor,
  }) {
    return Column(
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
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: iconColor.withOpacity(0.25),
                    blurRadius: 8,
                    offset: Offset(0, 3),
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
                      color: context.customColors.warningAccent, size: 18),
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
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                        color: context.customColors.gunMetal.withOpacity(0.25),
                        blurRadius: 8,
                        offset: Offset(0, 3),
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
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                          color: context.customColors.primaryAccent
                              .withOpacity(0.25),
                          blurRadius: 8,
                          offset: Offset(0, 3),
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
    );
  }

  Widget _buildMobileLayout({
    required BuildContext context,
    required String title,
    required String description,
    required List<String> technologies,
    required String githubUrl,
    String? liveUrl,
    required int stars,
    required IconData icon,
    required Color iconColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon and Star Badge Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    iconColor.withOpacity(0.8),
                    iconColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: iconColor.withOpacity(0.25),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 26,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: context.customColors.warningAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star,
                      color: context.customColors.warningAccent, size: 16),
                  SizedBox(width: 5),
                  Text(
                    stars.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: context.customColors.warningAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        // Title
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: context.customColors.gunMetal,
            letterSpacing: -0.5,
            height: 1.3,
          ),
        ),
        SizedBox(height: 12),
        // Description
        Text(
          description,
          style: TextStyle(
            fontSize: 15,
            color: context.customColors.cadetGrey,
            height: 1.6,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 16),
        // Technologies
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: technologies
              .map((tech) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: context.customColors.dutchWhite,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: context.customColors.cadetGrey.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      tech,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: context.customColors.gunMetal,
                      ),
                    ),
                  ))
              .toList(),
        ),
        SizedBox(height: 18),
        // Action Buttons - Stacked vertically for mobile
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () => _launchUrl(githubUrl),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14),
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
                      color: context.customColors.gunMetal.withOpacity(0.25),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
            if (liveUrl != null) ...[
              SizedBox(height: 12),
              GestureDetector(
                onTap: () => _launchUrl(liveUrl),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14),
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
                        color: context.customColors.primaryAccent
                            .withOpacity(0.25),
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ],
        ),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      print('Could not launch URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWide = width >= 1100;
    final isMobile = width < 600;
    final crossAxisCount = isWide ? 2 : 1;

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: context.customColors.dutchWhite,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16.0 : 24.0,
          vertical: isMobile ? 40.0 : 60.0,
        ),
        child: Column(
          children: [
            AnimatedOnVisible(
              delay: Duration(milliseconds: 100),
              animationType: AnimationType.fadeInUp,
              child: Text(
                "My Projects",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: isMobile ? 36 : 48,
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
                  fontSize: isMobile ? 16 : 19,
                  fontWeight: FontWeight.w500,
                  color: context.customColors.cadetGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
            isMobile
                ? _buildMobileProjectsList(context)
                : _buildDesktopProjectsGrid(context, isWide, crossAxisCount),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopProjectsGrid(
      BuildContext context, bool isWide, int crossAxisCount) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
      child: GridView.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: isWide ? 1.6 : 0.3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _buildProjectCard(
            context: context,
            title: "GUI YouTube Downloader",
            description:
                "A cross-platform Python application with modern GUI for downloading YouTube videos. Features multiple format options, quality selection from 4K to audio-only, playlist support, clip downloading, and progress tracking with CustomTkinter interface.",
            technologies: ["Python", "CustomTkinter", "yt-dlp", "GUI"],
            githubUrl: "https://github.com/ShalmonAnandas/Gui-Youtube-dl",
            stars: 124,
            delay: 400,
            icon: Icons.download,
            iconColor: Colors.red.shade600,
            isMobile: false,
          ),
          _buildProjectCard(
            context: context,
            title: "Stac",
            description:
                "A Server-Driven UI (SDUI) framework for Flutter that enables building, updating, and delivering dynamic UIs without redeploying apps. Define widgets as JSON that render at runtime with instant updates and A/B testing capabilities.",
            technologies: ["Flutter", "Dart", "JSON", "Server-Driven UI"],
            githubUrl: "https://github.com/StacDev/stac",
            liveUrl: "https://stac.dev",
            stars: 673,
            delay: 450,
            icon: Icons.widgets,
            iconColor: Colors.blue.shade700,
            isMobile: false,
          ),
          _buildProjectCard(
            context: context,
            title: "LigProX",
            description:
                "Cross-platform automation tool for protein-ligand docking preparation. Generates molecular conformations using Balloon, scrapes SwissTargetPrediction and String-DB, extracts top genes via K-means clustering, and retrieves purified PDB structures.",
            technologies: ["Python", "BioPython", "Selenium", "Pandas"],
            githubUrl: "https://github.com/ShalmonAnandas/LigProX",
            stars: 2,
            delay: 500,
            icon: Icons.science,
            iconColor: Colors.purple.shade600,
            isMobile: false,
          ),
          _buildProjectCard(
            context: context,
            title: "AI Story Game",
            description:
                "An interactive AI-powered web application for generating creative stories and visualizations. Uses Google's Gemini API for story generation and Imagen API to create illustrated slideshows that bring stories to life with AI-generated images.",
            technologies: ["TypeScript", "React", "Gemini API", "Vite"],
            githubUrl: "https://github.com/ShalmonAnandas/ai-story-game",
            stars: 0,
            delay: 550,
            icon: Icons.auto_stories,
            iconColor: Colors.orange.shade700,
            isMobile: false,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProjectsList(BuildContext context) {
    final projects = [
      {
        "title": "GUI YouTube Downloader",
        "description":
            "A cross-platform Python application with modern GUI for downloading YouTube videos. Features multiple format options, quality selection from 4K to audio-only, playlist support, clip downloading, and progress tracking with CustomTkinter interface.",
        "technologies": ["Python", "CustomTkinter", "yt-dlp", "GUI"],
        "githubUrl": "https://github.com/ShalmonAnandas/Gui-Youtube-dl",
        "stars": 0,
        "delay": 400,
        "icon": Icons.download,
        "iconColor": Colors.red.shade600,
      },
      {
        "title": "Stac",
        "description":
            "A Server-Driven UI (SDUI) framework for Flutter that enables building, updating, and delivering dynamic UIs without redeploying apps. Define widgets as JSON that render at runtime with instant updates and A/B testing capabilities.",
        "technologies": ["Flutter", "Dart", "JSON", "Server-Driven UI"],
        "githubUrl": "https://github.com/StacDev/stac",
        "liveUrl": "https://stac.dev",
        "stars": 0,
        "delay": 450,
        "icon": Icons.widgets,
        "iconColor": Colors.blue.shade700,
      },
      {
        "title": "LigProX",
        "description":
            "Cross-platform automation tool for protein-ligand docking preparation. Generates molecular conformations using Balloon, scrapes SwissTargetPrediction and String-DB, extracts top genes via K-means clustering, and retrieves purified PDB structures.",
        "technologies": ["Python", "BioPython", "Selenium", "Pandas"],
        "githubUrl": "https://github.com/ShalmonAnandas/LigProX",
        "stars": 0,
        "delay": 500,
        "icon": Icons.science,
        "iconColor": Colors.purple.shade600,
      },
      {
        "title": "AI Story Game",
        "description":
            "An interactive AI-powered web application for generating creative stories and visualizations. Uses Google's Gemini API for story generation and Imagen API to create illustrated slideshows that bring stories to life with AI-generated images.",
        "technologies": ["TypeScript", "React", "Gemini API", "Vite"],
        "githubUrl": "https://github.com/ShalmonAnandas/ai-story-game",
        "stars": 0,
        "delay": 550,
        "icon": Icons.auto_stories,
        "iconColor": Colors.orange.shade700,
      },
    ];

    return Container(
      constraints: BoxConstraints(maxWidth: 600),
      child: Column(
        children: projects.map((project) {
          return _buildProjectCard(
            context: context,
            title: project["title"] as String,
            description: project["description"] as String,
            technologies: project["technologies"] as List<String>,
            githubUrl: project["githubUrl"] as String,
            liveUrl: project["liveUrl"] as String?,
            stars: project["stars"] as int,
            delay: project["delay"] as int,
            icon: project["icon"] as IconData,
            iconColor: project["iconColor"] as Color,
            isMobile: true,
          );
        }).toList(),
      ),
    );
  }
}
