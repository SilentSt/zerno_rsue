import 'package:flutter/material.dart';

typedef HoveredBuilder = Widget Function(BuildContext context, bool isHovered);

class HoveredWidget extends StatefulWidget {
  const HoveredWidget({
    Key? key,
    required this.builder,
    this.onHoverCursor = SystemMouseCursors.click,
  }) : super(key: key);

  final HoveredBuilder builder;
  final MouseCursor onHoverCursor;

  @override
  State<HoveredWidget> createState() => _HoveredWidgetState();
}

class _HoveredWidgetState extends State<HoveredWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (details) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (details) {
        setState(() {
          isHovered = false;
        });
      },
      cursor: widget.onHoverCursor,
      child: widget.builder(
        context,
        isHovered,
      ),
    );
  }
}
