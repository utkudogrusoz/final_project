import 'package:final_project/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SocialAccountButton extends StatelessWidget {
  const SocialAccountButton({@required this.iconName, super.key});
  final String? iconName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 64,
      decoration: BoxDecoration(
        color: context.inputTheme.fillColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
        image: DecorationImage(
          image: AssetImage('assets/icons/${iconName!}'),
        ),
      ),
    );
  }
}
