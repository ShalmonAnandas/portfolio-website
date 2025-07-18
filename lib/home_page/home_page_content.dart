import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:portfolio_website/utils/assets.dart';
import 'package:portfolio_website/utils/colors.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInDown(
              config: BaseAnimationConfig(
                delay: 100.ms,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        "Hi, I'm Shalmon Anandas",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: context.customColors.dutchWhite,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Software Developer & Computer Science Graduate",
                        style: TextStyle(
                          fontSize: 24,
                          color: context.customColors.dutchWhite.withOpacity(0.8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32),
                      Container(
                        constraints: BoxConstraints(maxWidth: 600),
                        child: Text(
                          "I create innovative solutions through code, specializing in full-stack development, mobile applications, and API design. From Python to Flutter, I love building applications that make a difference.",
                          style: TextStyle(
                            fontSize: 18,
                            color: context.customColors.dutchWhite.withOpacity(0.9),
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FadeInDown(
              config: BaseAnimationConfig(
                delay: 300.ms,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: widget.width * 0.4,
                    child: Image.asset(Assets.portfolioFilled),
                  ),
                ),
              ),
            ),
            ...List.generate(
              max(2, ((widget.height / widget.width) * 2).round()),
              (index) => FadeInDown(
                config: BaseAnimationConfig(
                  delay: ((index + 1) * 200 + 500).ms,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: widget.width * 0.3,
                      child: Image.asset(Assets.portfolioOutlined),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
