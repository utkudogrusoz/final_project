import 'package:flutter/material.dart';

class HomeImageCard extends StatelessWidget {
  const HomeImageCard({
    this.color,
    this.imageUrl,
    this.child,
    super.key,
  });
  final Color? color;
  final Widget? child;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: imageUrl == null
          ? BoxDecoration(color: color)
          : BoxDecoration(
              color: color,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  imageUrl!,
                ),
              ),
            ),
      child: child ?? Container(),
    );
  }
}