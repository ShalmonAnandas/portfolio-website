import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/colors.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: height * 0.8,
          width: width,
          decoration: BoxDecoration(
            color: context.customColors.cadetGrey,
          ),
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: context.customColors.gunMetal,
          ),
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: context.customColors.cadetGrey,
          ),
        ),
        Container(
          height: height * 0.3,
          width: width,
          decoration: BoxDecoration(
            color: context.customColors.gunMetal,
          ),
        ),
      ],
    );
  }
}
