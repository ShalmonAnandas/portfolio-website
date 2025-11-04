import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A widget that animates its child only once when it becomes visible
class AnimatedOnVisible extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final AnimationType animationType;

  const AnimatedOnVisible({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.delay = Duration.zero,
    this.curve = Curves.easeOut,
    this.animationType = AnimationType.fadeInUp,
  });

  @override
  State<AnimatedOnVisible> createState() => _AnimatedOnVisibleState();
}

class _AnimatedOnVisibleState extends State<AnimatedOnVisible>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasAnimated = false;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkVisibility() {
    if (_hasAnimated) return;

    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final screenHeight = MediaQuery.of(context).size.height;

    // Check if at least 20% of the widget is visible
    final isVisible = position.dy < screenHeight * 0.9 &&
        position.dy + size.height > screenHeight * 0.1;

    if (isVisible && !_isVisible) {
      setState(() {
        _isVisible = true;
        _hasAnimated = true;
      });
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        _checkVisibility();
        return false;
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return _buildAnimatedWidget();
        },
        child: widget.child,
      ),
    );
  }

  Widget _buildAnimatedWidget() {
    switch (widget.animationType) {
      case AnimationType.fadeIn:
        return Opacity(
          opacity: _animation.value,
          child: widget.child,
        );
      case AnimationType.fadeInUp:
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - _animation.value)),
            child: widget.child,
          ),
        );
      case AnimationType.fadeInDown:
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(0, -30 * (1 - _animation.value)),
            child: widget.child,
          ),
        );
      case AnimationType.fadeInLeft:
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(-30 * (1 - _animation.value), 0),
            child: widget.child,
          ),
        );
      case AnimationType.fadeInRight:
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(30 * (1 - _animation.value), 0),
            child: widget.child,
          ),
        );
      case AnimationType.scaleIn:
        return Opacity(
          opacity: _animation.value,
          child: Transform.scale(
            scale: 0.8 + (0.2 * _animation.value),
            child: widget.child,
          ),
        );
    }
  }
}

enum AnimationType {
  fadeIn,
  fadeInUp,
  fadeInDown,
  fadeInLeft,
  fadeInRight,
  scaleIn,
}
