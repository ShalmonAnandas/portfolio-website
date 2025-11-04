import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/static_text.dart';

class LandscapeHeader extends StatelessWidget {
  const LandscapeHeader({
    super.key,
    required this.height,
    required this.width,
    required this.ctaList,
    required this.headerColor,
  });

  final double height;
  final double width;
  final List<Widget> ctaList;
  final Color headerColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: height * 0.1,
          width: width,
          color: Colors.white.withOpacity(0.06),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  StaticText.shalmonAnandas,
                  style: TextStyle(
                    color: headerColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 34,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              Spacer(),
              ...ctaList
            ],
          ),
        ),
      ),
    );
  }
}
