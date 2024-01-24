import 'package:flutter/material.dart';

class HomeCardTitle extends StatelessWidget {
  const HomeCardTitle({
    this.title,
    this.titleColor,
    super.key,
  });
  final String? title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: TextStyle(
        color: titleColor,
        fontSize: 34,
        fontWeight: FontWeight.bold,
        height: 1,
        fontFamily: 'Metropolis',
      ),
    );
  }
}