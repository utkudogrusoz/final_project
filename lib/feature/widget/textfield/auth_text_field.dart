import 'package:final_project/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthTextField extends ConsumerStatefulWidget {
  const AuthTextField({
    @required this.labelText,
    @required this.textEditingController,
    this.textIsHidden,
    this.onPressed,
    this.keyboardType,
    super.key,
  });
  final TextEditingController? textEditingController;
  final String? labelText;
  final bool? textIsHidden;
  final void Function()? onPressed;
  final TextInputType? keyboardType;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends ConsumerState<AuthTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: Theme.of(context).inputDecorationTheme.fillColor,
          borderRadius: const BorderRadius.all(Radius.circular(24)),
        ),
        child: TextField(
          cursorColor: Colors.amber,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          autocorrect: false,
          obscureText: widget.textIsHidden ?? false,
          controller: widget.textEditingController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber),
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            suffixIcon: widget.textIsHidden != null
                ? IconButton(
                    onPressed: () {
                      widget.onPressed!();
                    },
                    icon: Icon(
                      widget.textIsHidden ?? true
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  )
                : const SizedBox(),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            label: Padding(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: Text(
                widget.labelText!,
                style: context.textTheme.labelSmall,
              ),
            ),
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 50,
            ),
            isDense: true,
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            filled: true,
            fillColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
