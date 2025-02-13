import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:scroll_animator/scroll_animator.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final ScrollController _scrollController;
  bool _hasNavigated = false;

  @override
  void initState() {
    _scrollController = AnimatedScrollController(
      animationFactory: const ChromiumImpulse(),
    );
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
      } else if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward &&
          !_hasNavigated) {
        _hasNavigated = true;
        Navigator.pop(context);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(MediaQuery.of(context).size.height * 0.1,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      controller: _scrollController,
      child: Container(
        height: height * 1.1,
        width: width,
        decoration: BoxDecoration(
          color: context.customColors.dutchWhite,
        ),
      ),
    );
  }
}
