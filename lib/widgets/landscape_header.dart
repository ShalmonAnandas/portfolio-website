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
    return SizedBox(
      height: height * 0.1,
      width: width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              StaticText.shalmonAnandas,
              style: TextStyle(
                color: headerColor,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
          Spacer(),
          ...ctaList
        ],
      ),
    );
  }
}
