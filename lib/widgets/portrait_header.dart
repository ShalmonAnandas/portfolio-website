import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/assets.dart';
import 'package:portfolio_website/utils/static_text.dart';

class PortraitHeader extends StatelessWidget {
  const PortraitHeader({
    super.key,
    required this.height,
    required this.width,
    required this.headerColor,
  });

  final double height;
  final double width;
  final Color headerColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.1,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.1),
            Colors.transparent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Tooltip(
                  message: StaticText.menuIconAttribution,
                  child: Image.asset(
                    Assets.drawerIcon,
                    width: 32,
                    height: 32,
                    color: headerColor,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
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
        ],
      ),
    );
  }
}
