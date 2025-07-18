import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:portfolio_website/utils/colors.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key, required this.height, required this.width});

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
    return SlideInLeft(
      config: BaseAnimationConfig(
        delay: Duration(milliseconds: delay),
        child: Container(
          margin: EdgeInsets.only(bottom: 24),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isLatest ? context.customColors.gunMetal : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: isLatest ? null : Border.all(color: context.customColors.gunMetal.withOpacity(0.2)),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: isLatest ? context.customColors.dutchWhite : context.customColors.gunMetal,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          company,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: isLatest ? context.customColors.dutchWhite.withOpacity(0.9) : context.customColors.cadetGrey,
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
                    color: isLatest ? context.customColors.dutchWhite.withOpacity(0.8) : context.customColors.cadetGrey,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "$period • $duration",
                    style: TextStyle(
                      fontSize: 14,
                      color: isLatest ? context.customColors.dutchWhite.withOpacity(0.8) : context.customColors.cadetGrey,
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
                    color: isLatest ? context.customColors.dutchWhite.withOpacity(0.8) : context.customColors.cadetGrey,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "$location • $type",
                    style: TextStyle(
                      fontSize: 14,
                      color: isLatest ? context.customColors.dutchWhite.withOpacity(0.8) : context.customColors.cadetGrey,
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
                        color: isLatest ? context.customColors.dutchWhite : context.customColors.cadetGrey,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          note,
                          style: TextStyle(
                            fontSize: 13,
                            color: isLatest ? context.customColors.dutchWhite : context.customColors.cadetGrey,
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
                    color: isLatest ? context.customColors.dutchWhite : context.customColors.gunMetal,
                  ),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: skills
                      .map((skill) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: isLatest 
                                  ? context.customColors.dutchWhite.withOpacity(0.2) 
                                  : context.customColors.gunMetal.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              skill,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isLatest ? context.customColors.dutchWhite : context.customColors.gunMetal,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ],
          ),
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
    return SlideInLeft(
      config: BaseAnimationConfig(
        delay: Duration(milliseconds: delay),
        child: Container(
          margin: EdgeInsets.only(bottom: 16),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: context.customColors.cadetGrey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
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
            SlideInLeft(
              config: BaseAnimationConfig(
                delay: 200.ms,
                child: Text(
                  "My Work Experience",
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
                  "Professional journey and career milestones",
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
              constraints: BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Experience Section
                  Text(
                    "Professional Experience",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: context.customColors.gunMetal,
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
                    note: "Working at Snapwork Technologies as a deputed developer on behalf of Puretech.",
                    delay: 800,
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
                    skills: ["Red Hat Enterprise Linux (RHEL)", "Linux System Administration"],
                    delay: 1000,
                    isLatest: false,
                  ),
                  _buildExperienceCard(
                    context: context,
                    title: "Intern",
                    company: "ICMR - National Institute for Research in Reproductive and Child Health (NIRRCH)",
                    duration: "9 months",
                    period: "Sep 2022 - May 2023",
                    location: "Mumbai, Maharashtra, India",
                    type: "Internship",
                    skills: ["Python (Programming Language)", "Logical Volume Manager (LVM)"],
                    delay: 1200,
                    isLatest: false,
                  ),
                  
                  SizedBox(height: 48),
                  
                  // Education Section
                  Text(
                    "Education",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: context.customColors.gunMetal,
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildEducationCard(
                    context: context,
                    degree: "Master of Science in Computer Science",
                    institution: "University of Mumbai",
                    period: "2021 - 2023",
                    delay: 1400,
                  ),
                  _buildEducationCard(
                    context: context,
                    degree: "Bachelor of Science in Computer Science",
                    institution: "University of Mumbai",
                    period: "2018 - 2021",
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