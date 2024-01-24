import 'package:final_project/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.text, this.backgroundColor, this.onPressed, super.key});
  final String? text;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: backgroundColor == null
            ? const MaterialStatePropertyAll(4)
            : MaterialStatePropertyAll(0),
        textStyle: context.textButtonTheme.style!.textStyle,
        shadowColor: MaterialStatePropertyAll(Colors.amber),
        maximumSize: const MaterialStatePropertyAll(Size(343, 48)),
        minimumSize: const MaterialStatePropertyAll(Size(343, 48)),
        backgroundColor: MaterialStatePropertyAll(Colors.amber),
      ),
      onPressed: () {
        onPressed!();
      },
      child: Text(
        text ?? '',
        style: context.textTheme.titleSmall,
      ),
    );
  }
}
