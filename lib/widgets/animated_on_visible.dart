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
  // Constants for visibility detection
  static const double _visibilityThresholdTop = 0.9;
  static const double _visibilityThresholdBottom = 0.1;
  static const double _animationOffset = 30.0;
  static const double _scaleStart = 0.8;
  
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
    
    // Check visibility once after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkVisibility() {
    if (_hasAnimated || !mounted) return;

    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null || !renderBox.attached) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final screenHeight = MediaQuery.of(context).size.height;

    // Check if at least 20% of the widget is visible
    final isVisible = position.dy < screenHeight * _visibilityThresholdTop &&
        position.dy + size.height > screenHeight * _visibilityThresholdBottom;

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
            offset: Offset(0, _animationOffset * (1 - _animation.value)),
            child: widget.child,
          ),
        );
      case AnimationType.fadeInDown:
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(0, -_animationOffset * (1 - _animation.value)),
            child: widget.child,
          ),
        );
      case AnimationType.fadeInLeft:
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(-_animationOffset * (1 - _animation.value), 0),
            child: widget.child,
          ),
        );
      case AnimationType.fadeInRight:
        return Opacity(
          opacity: _animation.value,
          child: Transform.translate(
            offset: Offset(_animationOffset * (1 - _animation.value), 0),
            child: widget.child,
          ),
        );
      case AnimationType.scaleIn:
        return Opacity(
          opacity: _animation.value,
          child: Transform.scale(
            scale: _scaleStart + ((1.0 - _scaleStart) * _animation.value),
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
