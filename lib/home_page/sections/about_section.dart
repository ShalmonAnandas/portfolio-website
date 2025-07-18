import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:portfolio_website/utils/colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key, required this.height, required this.width});

  final double height;
  final double width;

  Widget _buildSkillChip(BuildContext context, String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: context.customColors.gunMetal,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: context.customColors.dutchWhite,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: context.customColors.gunMetal,
            letterSpacing: -1,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: context.customColors.cadetGrey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: context.customColors.dutchWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Image Placeholder
            FadeInUp(
              config: BaseAnimationConfig(
                delay: 100.ms,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        context.customColors.gunMetal,
                        context.customColors.cadetGrey,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: context.customColors.dutchWhite,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            FadeIn(
              config: BaseAnimationConfig(
                delay: 200.ms,
                child: Text(
                  "About Me",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 42,
                      color: Colors.black,
                      letterSpacing: -0.5),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 32),
            SlideInRight(
              config: BaseAnimationConfig(
                delay: 400.ms,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 800),
                  child: Text(
                    "I'm a passionate software developer with a Master's degree in Computer Science, specializing in full-stack development, mobile applications, and API design. With expertise in Python, Dart/Flutter, JavaScript, and C++, I love creating innovative solutions that solve real-world problems.\n\nMy journey in technology spans across diverse projects from GUI applications and web development to bioinformatics tools and interactive games. I'm particularly interested in creating user-friendly applications that bridge the gap between complex technology and everyday users.",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black87,
                        height: 1.7,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            FadeInUp(
              config: BaseAnimationConfig(
                delay: 600.ms,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 12,
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
            ),
            SizedBox(height: 40),
            SlideInUp(
              config: BaseAnimationConfig(
                delay: 800.ms,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildExperienceCard(context, "3+", "Years Experience"),
                    SizedBox(width: 24),
                    _buildExperienceCard(context, "15+", "Projects"),
                    SizedBox(width: 24),
                    _buildExperienceCard(context, "120+", "GitHub Stars"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}