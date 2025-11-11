import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCardBackground = Color(0xFFFFFFFF);
  static const Color lightPrimaryText = Color(0xFF1A1A1A);
  static const Color lightSecondaryText = Color(0xFF121417);
  static const Color lightTertiaryText = Color(0xFF6B7582);
  static const Color lightHintText = Color(0xFF9E9E9E);
  static const Color lightIconColor = Color(0xFF1A1A1A);
  static const Color lightSearchIcon = Color(0xFF757575);
  static const Color lightSearchBackground = Color(0xFFF5F5F5);
  static const Color lightBorder = Color(0xFFE0E0E0);
  static const Color lightFlagBackground = Color(0xFFE0F7FA);
  static const Color lightErrorPlaceholder = Color(0xFFF5F5F5);
  static const Color lightFavorite = Colors.red;
  static const Color lightCheckIcon = Colors.blue;

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkCardBackground = Color(0xFF2D2D2D);
  static const Color darkPrimaryText = Color(0xFFFFFFFF);
  static const Color darkSecondaryText = Color(0xFFE0E0E0);
  static const Color darkTertiaryText = Color(0xFFB0B0B0);
  static const Color darkHintText = Color(0xFF9E9E9E);
  static const Color darkIconColor = Color(0xFFFFFFFF);
  static const Color darkSearchIcon = Color(0xFFB0B0B0);
  static const Color darkSearchBackground = Color(0xFF2D2D2D);
  static const Color darkBorder = Color(0xFF3D3D3D);
  static const Color darkFlagBackground = Color(0xFF1A3A3A);
  static const Color darkErrorPlaceholder = Color(0xFF2D2D2D);
  static const Color darkFavorite = Colors.red;
  static const Color darkCheckIcon = Colors.blue;
  static const Color lightErrorIcon = Color(0xFFEF5350);
  static const Color darkErrorIcon = Color(0xFFEF5350);
  static const Color lightEmptyIcon = Color(0xFF9E9E9E);
  static const Color darkEmptyIcon = Color(0xFF757575);
  static const Color lightEmptyText = Color(0xFF757575);
  static const Color darkEmptyText = Color(0xFFB0B0B0);
  static const Color lightShimmerBase = Color(0xFFE0E0E0);
  static const Color lightShimmerHighlight = Color(0xFFF5F5F5);
  static const Color darkShimmerBase = Color(0xFF3D3D3D);
  static const Color darkShimmerHighlight = Color(0xFF4D4D4D);

  // Theme-aware color getters
  static Color getBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackground
        : lightBackground;
  }

  static Color getSurface(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkSurface
        : lightSurface;
  }

  static Color getCardBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkCardBackground
        : lightCardBackground;
  }

  static Color getPrimaryText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkPrimaryText
        : lightPrimaryText;
  }

  static Color getSecondaryText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkSecondaryText
        : lightSecondaryText;
  }

  static Color getTertiaryText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkTertiaryText
        : lightTertiaryText;
  }

  static Color getHintText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkHintText
        : lightHintText;
  }

  static Color getIconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkIconColor
        : lightIconColor;
  }

  static Color getSearchIcon(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkSearchIcon
        : lightSearchIcon;
  }

  static Color getSearchBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkSearchBackground
        : lightSearchBackground;
  }

  static Color getBorder(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBorder
        : lightBorder;
  }

  static Color getFlagBackground(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkFlagBackground
        : lightFlagBackground;
  }

  static Color getErrorPlaceholder(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkErrorPlaceholder
        : lightErrorPlaceholder;
  }

  static Color getFavorite(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkFavorite
        : lightFavorite;
  }

  static Color getCheckIcon(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkCheckIcon
        : lightCheckIcon;
  }

  static Color getErrorIcon(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkErrorIcon
        : lightErrorIcon;
  }

  static Color getEmptyIcon(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkEmptyIcon
        : lightEmptyIcon;
  }

  static Color getEmptyText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkEmptyText
        : lightEmptyText;
  }

  static Color getShimmerBase(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkShimmerBase
        : lightShimmerBase;
  }

  static Color getShimmerHighlight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkShimmerHighlight
        : lightShimmerHighlight;
  }
}
