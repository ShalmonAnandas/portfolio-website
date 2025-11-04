import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/widgets/animated_on_visible.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.height, required this.width});

  final double height;
  final double width;

  Widget _buildSkillChip(BuildContext context, String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
            color: context.customColors.primaryAccent.withOpacity(0.25),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildExperienceCard(
      BuildContext context, String number, String label) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withOpacity(0.35)),
          ),
          child: Column(
            children: [
              Text(
                number,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  color: context.customColors.primaryAccent,
                  letterSpacing: -1.5,
                ),
              ),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: context.customColors.gunMetal.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = width >= 1000;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: context.customColors.dutchWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOnVisible(
              delay: Duration(milliseconds: 100),
              animationType: AnimationType.scaleIn,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
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
                      color:
                          context.customColors.primaryAccent.withOpacity(0.3),
                      blurRadius: 30,
                      offset: Offset(0, 15),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 32),
            AnimatedOnVisible(
              delay: Duration(milliseconds: 200),
              animationType: AnimationType.fadeInUp,
              child: Text(
                "About Me",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 48,
                    color: context.customColors.gunMetal,
                    letterSpacing: -1.0),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16),
            AnimatedOnVisible(
              delay: Duration(milliseconds: 300),
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
            SizedBox(height: 36),
            AnimatedOnVisible(
              delay: Duration(milliseconds: 400),
              animationType: AnimationType.fadeInUp,
              child: Container(
                constraints: BoxConstraints(maxWidth: 1100),
                child: isWide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "I'm a passionate software developer with a Master's degree in Computer Science, specializing in full-stack development, mobile applications, and API design. With expertise in Python, Dart/Flutter, Svelte, Go, and C++, I love creating innovative solutions that solve real-world problems.",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: context.customColors.cadetGrey,
                                  height: 1.8,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(width: 32),
                          Expanded(
                            child: Text(
                              "My journey in technology spans across diverse projects from GUI applications and web development to bioinformatics tools and interactive games. I'm particularly interested in creating user-friendly applications that bridge the gap between complex technology and everyday users.",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: context.customColors.cadetGrey,
                                  height: 1.8,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        "I'm a passionate software developer with a Master's degree in Computer Science, specializing in full-stack development, mobile applications, and API design. With expertise in Python, Dart/Flutter, JavaScript, and C++, I love creating innovative solutions that solve real-world problems.\n\nMy journey in technology spans across diverse projects from GUI applications and web development to bioinformatics tools and interactive games. I'm particularly interested in creating user-friendly applications that bridge the gap between complex technology and everyday users.",
                        style: TextStyle(
                            fontSize: 18,
                            color: context.customColors.cadetGrey,
                            height: 1.8,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
            SizedBox(height: 48),
            AnimatedOnVisible(
              delay: Duration(milliseconds: 500),
              animationType: AnimationType.fadeInUp,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildSkillChip(context, "Python"),
                  _buildSkillChip(context, "Dart/Flutter"),
                  _buildSkillChip(context, "JavaScript"),
                  _buildSkillChip(context, "TypeScript"),
                  _buildSkillChip(context, "C++"),
                  _buildSkillChip(context, "Java"),
                  _buildSkillChip(context, "FastAPI"),
                  _buildSkillChip(context, "React"),
                  _buildSkillChip(context, "Node.js"),
                  _buildSkillChip(context, "Git"),
                  _buildSkillChip(context, "Linux"),
                  _buildSkillChip(context, "Docker"),
                ],
              ),
            ),
            SizedBox(height: 48),
            AnimatedOnVisible(
              delay: Duration(milliseconds: 600),
              animationType: AnimationType.fadeInUp,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 24,
                runSpacing: 24,
                children: [
                  _buildExperienceCard(context, "3+", "Years Experience"),
                  _buildExperienceCard(context, "20+", "Projects"),
                  _buildExperienceCard(context, "700+", "GitHub Stars"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
