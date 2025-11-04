import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/widgets/animated_on_visible.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection(
      {super.key, required this.height, required this.width});

  final double height;
  final double width;

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
  }) {
    return AnimatedOnVisible(
      delay: Duration(milliseconds: delay),
      animationType: AnimationType.fadeInUp,
      child: Container(
        margin: EdgeInsets.only(bottom: 28),
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(
          gradient: isLatest
              ? LinearGradient(
                  colors: [
                    context.customColors.primaryAccent,
                    context.customColors.secondaryAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isLatest ? null : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isLatest
              ? null
              : Border.all(
                  color: context.customColors.cadetGrey.withOpacity(0.2),
                  width: 1.5,
                ),
          boxShadow: [
            BoxShadow(
              color: isLatest
                  ? context.customColors.primaryAccent.withOpacity(0.3)
                  : Colors.black.withOpacity(0.08),
              blurRadius: isLatest ? 25 : 15,
              offset: Offset(0, isLatest ? 10 : 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isLatest
                        ? Colors.white.withOpacity(0.2)
                        : context.customColors.primaryAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.work_outline,
                    color: isLatest
                        ? Colors.white
                        : context.customColors.primaryAccent,
                    size: 24,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: isLatest
                              ? Colors.white
                              : context.customColors.gunMetal,
                          letterSpacing: -0.5,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        company,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: isLatest
                              ? Colors.white.withOpacity(0.95)
                              : context.customColors.cadetGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isLatest)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      'Current',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: context.customColors.primaryAccent,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: isLatest
                      ? Colors.white.withOpacity(0.9)
                      : context.customColors.cadetGrey,
                ),
                SizedBox(width: 10),
                Text(
                  "$period • $duration",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: isLatest
                        ? Colors.white.withOpacity(0.9)
                        : context.customColors.cadetGrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 18,
                  color: isLatest
                      ? Colors.white.withOpacity(0.9)
                      : context.customColors.cadetGrey,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "$location • $type",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: isLatest
                          ? Colors.white.withOpacity(0.9)
                          : context.customColors.cadetGrey,
                    ),
                  ),
                ),
              ],
            ),
            if (note != null) ...[
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isLatest
                      ? Colors.white.withOpacity(0.15)
                      : context.customColors.dutchWhite,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 18,
                      color: isLatest
                          ? Colors.white
                          : context.customColors.primaryAccent,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        note,
                        style: TextStyle(
                          fontSize: 14,
                          color: isLatest
                              ? Colors.white.withOpacity(0.95)
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
              SizedBox(height: 20),
              Text(
                "Key Skills:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isLatest
                      ? Colors.white
                      : context.customColors.gunMetal,
                ),
              ),
              SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: skills
                    .map((skill) => Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: isLatest
                                ? Colors.white.withOpacity(0.2)
                                : context.customColors.primaryAccent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isLatest
                                  ? Colors.white.withOpacity(0.3)
                                  : context.customColors.primaryAccent.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            skill,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: isLatest
                                  ? Colors.white
                                  : context.customColors.primaryAccent,
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
  }) {
    return AnimatedOnVisible(
      delay: Duration(milliseconds: delay),
      animationType: AnimationType.fadeInUp,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: context.customColors.cadetGrey.withOpacity(0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.customColors.successAccent,
                    context.customColors.successAccent.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.school_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    degree,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: context.customColors.gunMetal,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    institution,
                    style: TextStyle(
                      fontSize: 17,
                      color: context.customColors.cadetGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                        color: context.customColors.cadetGrey,
                      ),
                      SizedBox(width: 6),
                      Text(
                        period,
                        style: TextStyle(
                          fontSize: 15,
                          color: context.customColors.cadetGrey,
                        ),
                      ),
                    ],
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            context.customColors.dutchWhite,
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
                "My Work Experience",
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
                "Professional journey and career milestones",
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
              constraints: BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Experience Section
                  Text(
                    "Professional Experience",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: context.customColors.gunMetal,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 32),
                  _buildExperienceCard(
                    context: context,
                    title: "Flutter Developer",
                    company: "SnapWork Technologies",
                    duration: "8 months",
                    period: "Dec 2024 - Present",
                    location: "On-site",
                    type: "Full-time",
                    skills: ["Flutter", "Dart", "Mobile Development"],
                    delay: 400,
                    isLatest: true,
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
                    delay: 450,
                    isLatest: false,
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
                    delay: 500,
                    isLatest: false,
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
                    delay: 550,
                    isLatest: false,
                  ),

                  SizedBox(height: 60),

                  // Education Section
                  Text(
                    "Education",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: context.customColors.gunMetal,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 32),
                  _buildEducationCard(
                    context: context,
                    degree: "Master of Science in Computer Science",
                    institution: "University of Mumbai",
                    period: "2021 - 2023",
                    delay: 600,
                  ),
                  _buildEducationCard(
                    context: context,
                    degree: "Bachelor of Science in Computer Science",
                    institution: "University of Mumbai",
                    period: "2018 - 2021",
                    delay: 650,
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
