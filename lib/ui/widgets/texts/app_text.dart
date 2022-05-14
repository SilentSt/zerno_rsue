import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    Key? key,
    required this.text,
    required this.style,
  }) : super(key: key);

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      overflow: TextOverflow.ellipsis,
    );
  }

  //factory AppText.H1()=>AppText(text: text, style: style)
}
