import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:portfolio_website/utils/assets.dart';

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
                  child: SizedBox(
                    width: widget.width * 0.6,
                    child: Image.asset(Assets.portfolioFilled),
                  ),
                ),
              ),
            ),
            ...List.generate(
              max(3, ((widget.height / widget.width) * 4).round()),
              (index) => FadeInDown(
                config: BaseAnimationConfig(
                  delay: ((index + 1) * 100).ms,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: SizedBox(
                      width: widget.width * 0.6,
                      child:
                          Image.asset(Assets.portfolioOutlined),
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
