import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:portfolio_website/utils/colors.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection(
      {super.key, required this.height, required this.width});

  final double height;
  final double width;

  // Helper function to get randomized animation based on index
  Widget _getRandomAnimation({
    required int index,
    required int delay,
    required Widget child,
  }) {
    final animations = [
      // Index 0: FadeInUp
      FadeInUp(
          config: BaseAnimationConfig(
              delay: Duration(milliseconds: delay), child: child)),
      // Index 1: SlideInLeft
      SlideInLeft(
          config: BaseAnimationConfig(
              delay: Duration(milliseconds: delay), child: child)),
      // Index 2: SlideInRight
      SlideInRight(
          config: BaseAnimationConfig(
              delay: Duration(milliseconds: delay), child: child)),
      // Index 3: FadeIn
      FadeIn(
          config: BaseAnimationConfig(
              delay: Duration(milliseconds: delay), child: child)),
    ];

    return animations[index % animations.length];
  }

  Widget _buildExperienceCard({
    required BuildContext context,
    required String title,
    required String company,
    required String duration,
    required String period,
    required String location,
    required String type,
    required List<String> skills,
    String? note,
    required int delay,
    required bool isLatest,
    required int index,
  }) {
    return _getRandomAnimation(
      index: index,
      delay: delay,
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: isLatest
              ? LinearGradient(
                  colors: [
                    context.customColors.gunMetal,
                    context.customColors.gunMetal.withOpacity(0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isLatest ? null : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: isLatest
              ? null
              : Border.all(
                  color: context.customColors.gunMetal.withOpacity(0.15),
                  width: 1.5,
                ),
          boxShadow: [
            BoxShadow(
              color: isLatest
                  ? context.customColors.gunMetal.withOpacity(0.25)
                  : Colors.black.withOpacity(0.08),
              blurRadius: isLatest ? 20 : 12,
              offset: Offset(0, isLatest ? 8 : 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isLatest
                        ? context.customColors.dutchWhite.withOpacity(0.2)
                        : context.customColors.gunMetal.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.work,
                    color: isLatest
                        ? context.customColors.dutchWhite
                        : context.customColors.gunMetal,
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: isLatest
                              ? context.customColors.dutchWhite
                              : context.customColors.gunMetal,
                          letterSpacing: -0.3,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        company,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isLatest
                              ? context.customColors.dutchWhite.withOpacity(0.9)
                              : context.customColors.cadetGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isLatest)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: context.customColors.dutchWhite,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Current',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: context.customColors.gunMetal,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: isLatest
                      ? context.customColors.dutchWhite.withOpacity(0.8)
                      : context.customColors.cadetGrey,
                ),
                SizedBox(width: 8),
                Text(
                  "$period • $duration",
                  style: TextStyle(
                    fontSize: 14,
                    color: isLatest
                        ? context.customColors.dutchWhite.withOpacity(0.8)
                        : context.customColors.cadetGrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: isLatest
                      ? context.customColors.dutchWhite.withOpacity(0.8)
                      : context.customColors.cadetGrey,
                ),
                SizedBox(width: 8),
                Text(
                  "$location • $type",
                  style: TextStyle(
                    fontSize: 14,
                    color: isLatest
                        ? context.customColors.dutchWhite.withOpacity(0.8)
                        : context.customColors.cadetGrey,
                  ),
                ),
              ],
            ),
            if (note != null) ...[
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isLatest
                      ? context.customColors.dutchWhite.withOpacity(0.1)
                      : context.customColors.cadetGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 16,
                      color: isLatest
                          ? context.customColors.dutchWhite
                          : context.customColors.cadetGrey,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        note,
                        style: TextStyle(
                          fontSize: 13,
                          color: isLatest
                              ? context.customColors.dutchWhite
                              : context.customColors.cadetGrey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (skills.isNotEmpty) ...[
              SizedBox(height: 16),
              Text(
                "Key Skills:",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isLatest
                      ? context.customColors.dutchWhite
                      : context.customColors.gunMetal,
                ),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 10,
                runSpacing: 8,
                children: skills
                    .map((skill) => Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: isLatest
                                ? context.customColors.dutchWhite
                                    .withOpacity(0.2)
                                : context.customColors.gunMetal
                                    .withOpacity(0.08),
                            borderRadius: BorderRadius.circular(12),
                            border: isLatest
                                ? Border.all(
                                    color: context.customColors.dutchWhite
                                        .withOpacity(0.3),
                                    width: 0.5,
                                  )
                                : Border.all(
                                    color: context.customColors.gunMetal
                                        .withOpacity(0.2),
                                    width: 0.5,
                                  ),
                          ),
                          child: Text(
                            skill,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: isLatest
                                  ? context.customColors.dutchWhite
                                  : context.customColors.gunMetal,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildEducationCard({
    required BuildContext context,
    required String degree,
    required String institution,
    required String period,
    required int delay,
    required int index,
  }) {
    return _getRandomAnimation(
      index: index,
      delay: delay,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.customColors.cadetGrey.withOpacity(0.08),
              context.customColors.cadetGrey.withOpacity(0.15),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: context.customColors.cadetGrey.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.customColors.gunMetal.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.school,
                color: context.customColors.gunMetal,
                size: 20,
              ),
            ),
            SizedBox(width: 16),
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
                  SizedBox(height: 4),
                  Text(
                    institution,
                    style: TextStyle(
                      fontSize: 16,
                      color: context.customColors.cadetGrey,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    period,
                    style: TextStyle(
                      fontSize: 14,
                      color: context.customColors.cadetGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: context.customColors.dutchWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
          children: [
            FadeIn(
              config: BaseAnimationConfig(
                delay: 200.ms,
                child: Text(
                  "My Work Experience",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 42,
                    color: context.customColors.gunMetal,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 16),
            SlideInUp(
              config: BaseAnimationConfig(
                delay: 400.ms,
                child: Text(
                  "Professional journey and career milestones",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: context.customColors.cadetGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 48),
            Container(
              constraints: BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Experience Section
                  Text(
                    "Professional Experience",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: context.customColors.gunMetal,
                      letterSpacing: -0.3,
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildExperienceCard(
                    context: context,
                    title: "Flutter Developer",
                    company: "SnapWork Technologies",
                    duration: "8 months",
                    period: "Dec 2024 - Present",
                    location: "On-site",
                    type: "Full-time",
                    skills: ["Flutter", "Dart", "Mobile Development"],
                    delay: 600,
                    isLatest: true,
                    index: 0,
                  ),
                  _buildExperienceCard(
                    context: context,
                    title: "Senior Software Developer",
                    company: "Pure Technology",
                    duration: "10 months",
                    period: "Mar 2024 - Dec 2024",
                    location: "Mumbai, Maharashtra, India",
                    type: "Full-time • On-site",
                    skills: ["Software Development", "Team Leadership"],
                    note:
                        "Working at Snapwork Technologies as a deputed developer on behalf of Puretech.",
                    delay: 700,
                    isLatest: false,
                    index: 1,
                  ),
                  _buildExperienceCard(
                    context: context,
                    title: "Junior Software Developer",
                    company: "Intellect Software Solutions Pvt. Ltd.",
                    duration: "10 months",
                    period: "Jun 2023 - Mar 2024",
                    location: "Borivali, Maharashtra, India",
                    type: "Full-time • On-site",
                    skills: [
                      "Red Hat Enterprise Linux (RHEL)",
                      "Linux System Administration"
                    ],
                    delay: 800,
                    isLatest: false,
                    index: 2,
                  ),
                  _buildExperienceCard(
                    context: context,
                    title: "Intern",
                    company:
                        "ICMR - National Institute for Research in Reproductive and Child Health (NIRRCH)",
                    duration: "9 months",
                    period: "Sep 2022 - May 2023",
                    location: "Mumbai, Maharashtra, India",
                    type: "Internship",
                    skills: [
                      "Python (Programming Language)",
                      "Logical Volume Manager (LVM)"
                    ],
                    delay: 900,
                    isLatest: false,
                    index: 3,
                  ),

                  SizedBox(height: 48),

                  // Education Section
                  Text(
                    "Education",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: context.customColors.gunMetal,
                      letterSpacing: -0.3,
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildEducationCard(
                    context: context,
                    degree: "Master of Science in Computer Science",
                    institution: "University of Mumbai",
                    period: "2021 - 2023",
                    delay: 1000,
                    index: 0,
                  ),
                  _buildEducationCard(
                    context: context,
                    degree: "Bachelor of Science in Computer Science",
                    institution: "University of Mumbai",
                    period: "2018 - 2021",
                    delay: 1100,
                    index: 1,
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
