import 'package:flutter/material.dart';

class ScrollingText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final double velocity;
  final TextAlign textAlign;

  ScrollingText(
      {required this.text,
      required this.style,
      this.velocity = 100.0,
      this.textAlign = TextAlign.center});

  @override
  _ScrollingTextState createState() => _ScrollingTextState();
}

class _ScrollingTextState extends State<ScrollingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset:
              Offset(_controller.value * MediaQuery.of(context).size.width, 0),
          child: child,
        );
      },
      child: Text(
        widget.text,
        style: widget.style,
      ),
    );
  }
}
