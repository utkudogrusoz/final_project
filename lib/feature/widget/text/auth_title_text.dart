import 'package:flutter/material.dart';

class AuthTitleText extends StatelessWidget {
  const AuthTitleText({this.title, super.key});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(title!,
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold));
  }
}
