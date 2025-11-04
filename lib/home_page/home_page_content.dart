import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/assets.dart';
import 'package:portfolio_website/widgets/animated_on_visible.dart';

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
            AnimatedOnVisible(
              delay: Duration(milliseconds: 100),
              animationType: AnimationType.fadeInDown,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: widget.width * 0.6,
                  child: Image.asset(Assets.portfolioFilled),
                ),
              ),
            ),
            ...List.generate(
              max(3, ((widget.height / widget.width) * 4).round()),
              (index) => AnimatedOnVisible(
                delay: Duration(milliseconds: (index + 1) * 100),
                animationType: AnimationType.fadeInDown,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: widget.width * 0.6,
                    child: Image.asset(Assets.portfolioOutlined),
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
