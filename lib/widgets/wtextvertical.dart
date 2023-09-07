import 'package:flutter/material.dart';

class VerticalText extends StatelessWidget {
  const VerticalText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      children: text.characters.map((char) {
        return Text(
          char,
          style: TextStyle(fontSize: 20),
        );
      }).toList(),
    );
  }
}
