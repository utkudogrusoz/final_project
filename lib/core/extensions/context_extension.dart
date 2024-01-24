import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
//  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;
  Brightness get platformBrightness => mediaQuery.platformBrightness;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  InputDecorationTheme get inputTheme => theme.inputDecorationTheme;
  Color get backgroundColor => theme.scaffoldBackgroundColor;
  TextButtonThemeData get textButtonTheme => theme.textButtonTheme;
}
