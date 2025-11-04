import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/hex_color_helper.dart';

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get customColors => theme.colorScheme;
}

extension ColorSchemeExtension on ColorScheme {
  // Updated modern color palette
  Color get dutchWhite => HexColorHelper.fromHex("F5F7FA"); // Lighter, cleaner background
  Color get gunMetal => HexColorHelper.fromHex("1A1D29"); // Richer dark color
  Color get cadetGrey => HexColorHelper.fromHex("64748B"); // More vibrant grey
  Color get primaryAccent => HexColorHelper.fromHex("6366F1"); // Indigo accent
  Color get secondaryAccent => HexColorHelper.fromHex("8B5CF6"); // Purple accent
  Color get successAccent => HexColorHelper.fromHex("10B981"); // Green accent
  Color get warningAccent => HexColorHelper.fromHex("F59E0B"); // Amber accent
}
