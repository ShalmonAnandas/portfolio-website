import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/hex_color_helper.dart';

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get customColors => theme.colorScheme;
}

extension ColorSchemeExtension on ColorScheme {
  Color get dutchWhite => HexColorHelper.fromHex("f1d8c4");
  Color get gunMetal => HexColorHelper.fromHex("2b3537");
  Color get cadetGrey => HexColorHelper.fromHex("8aa8ab");
}
