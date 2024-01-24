import 'package:final_project/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteButton extends ConsumerStatefulWidget {
  const FavoriteButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends ConsumerState<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow,
            offset: Offset(0, 2),
            blurRadius: 8.0,
          ),
        ],
        color: context.colorScheme.secondary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          Icons.favorite_border_outlined,
          size: 18,
          color: context.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
