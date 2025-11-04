import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final isWide = widget.width >= 900;
    final heroHeight = (widget.height);
    final headerSize = isWide ? 40.0 : 32.0;
    final separatorSize = isWide ? 64.0 : 40.0;
    final subheadSize = isWide ? 24.0 : 16.0;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SizedBox(
        height: heroHeight,
        width: widget.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isWide
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AnimatedOnVisible(
                            delay: Duration(milliseconds: 120),
                            animationType: AnimationType.fadeInRight,
                            child: Text(
                              'Shalmon Anandas',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.poppins(
                                fontSize: headerSize,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                height: 1.2,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                        ),
                        AnimatedOnVisible(
                          delay: Duration(milliseconds: 120),
                          animationType: AnimationType.fadeInRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isWide ? 24 : 16),
                            child: Text(
                              '|',
                              style: GoogleFonts.poppins(
                                fontSize: separatorSize,
                                fontWeight: FontWeight.w300,
                                color: Colors.white.withOpacity(0.6),
                                height: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: AnimatedOnVisible(
                            delay: Duration(milliseconds: 120),
                            animationType: AnimationType.fadeInRight,
                            child: Text(
                              'Flutter Developer',
                              textAlign: TextAlign.left,
                              style: GoogleFonts.poppins(
                                fontSize: headerSize,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                height: 1.2,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : AnimatedOnVisible(
                      delay: Duration(milliseconds: 120),
                      animationType: AnimationType.fadeInRight,
                      child: Text(
                        'Shalmon Anandas\nFlutter Developer',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: headerSize,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          height: 1.2,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
              SizedBox(height: isWide ? 32 : 24),
              AnimatedOnVisible(
                delay: Duration(milliseconds: 240),
                animationType: AnimationType.fadeInUp,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: isWide ? 48 : 16),
                  child: Text(
                    'Bringing 3+ years of experience to complex sectors, including FinTech, \nBFSI, and Bioinformatics. Explore my work below.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: subheadSize,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.85),
                      height: 1.6,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
