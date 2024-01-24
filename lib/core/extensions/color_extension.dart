import 'dart:ui';

extension ColorExtension on String {
  Color get toColor {
    return Color(int.parse('0xff$this'));
  }
}
