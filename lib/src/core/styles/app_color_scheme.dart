import 'package:flutter/material.dart';

class AppColorScheme {
  final Color background;
  final Color foreground;
  final Color card;
  final Color cardForeground;
  final Color popover;
  final Color popoverForeground;
  final Color primary;
  final Color primaryForeground;
  final Color secondary;
  final Color secondaryForeground;
  final Color muted;
  final Color mutedForeground;
  final Color accent;
  final Color accentForeground;
  final Color destructive;
  final Color destructiveForeground;
  final Color border;
  final Color input;
  final Color ring;
  final Color selection;

  const AppColorScheme({
    required this.background,
    required this.foreground,
    required this.card,
    required this.cardForeground,
    required this.popover,
    required this.popoverForeground,
    required this.primary,
    required this.primaryForeground,
    required this.secondary,
    required this.secondaryForeground,
    required this.muted,
    required this.mutedForeground,
    required this.accent,
    required this.accentForeground,
    required this.destructive,
    required this.destructiveForeground,
    required this.border,
    required this.input,
    required this.ring,
    required this.selection,
  });

  /// Returns a new [AppColorScheme] with the given properties updated.
  AppColorScheme copyWith({
    Color? background,
    Color? foreground,
    Color? card,
    Color? cardForeground,
    Color? popover,
    Color? popoverForeground,
    Color? primary,
    Color? primaryForeground,
    Color? secondary,
    Color? secondaryForeground,
    Color? muted,
    Color? mutedForeground,
    Color? accent,
    Color? accentForeground,
    Color? destructive,
    Color? destructiveForeground,
    Color? border,
    Color? input,
    Color? ring,
    Color? selection,
  }) {
    return AppColorScheme(
      background: background ?? this.background,
      foreground: foreground ?? this.foreground,
      card: card ?? this.card,
      cardForeground: cardForeground ?? this.cardForeground,
      popover: popover ?? this.popover,
      popoverForeground: popoverForeground ?? this.popoverForeground,
      primary: primary ?? this.primary,
      primaryForeground: primaryForeground ?? this.primaryForeground,
      secondary: secondary ?? this.secondary,
      secondaryForeground: secondaryForeground ?? this.secondaryForeground,
      muted: muted ?? this.muted,
      mutedForeground: mutedForeground ?? this.mutedForeground,
      accent: accent ?? this.accent,
      accentForeground: accentForeground ?? this.accentForeground,
      destructive: destructive ?? this.destructive,
      destructiveForeground:
          destructiveForeground ?? this.destructiveForeground,
      border: border ?? this.border,
      input: input ?? this.input,
      ring: ring ?? this.ring,
      selection: selection ?? this.selection,
    );
  }

  /// Returns the [AppColorScheme] for the light theme.
  factory AppColorScheme.light() {
    return AppColorScheme(
      background: const Color(0xffffffff),
      foreground: const Color(0xff020817),
      card: const Color(0xffffffff),
      cardForeground: const Color(0xff020817),
      popover: const Color(0xffffffff),
      popoverForeground: const Color(0xff020817),
      primary: const Color(0xff2563eb),
      primaryForeground: const Color(0xfff8fafc),
      secondary: const Color(0xfff1f5f9),
      secondaryForeground: const Color(0xff0f172a),
      muted: const Color(0xfff1f5f9),
      mutedForeground: const Color(0xff64748b),
      accent: const Color(0xfff1f5f9),
      accentForeground: const Color(0xff0f172a),
      destructive: const Color(0xffef4444),
      destructiveForeground: const Color(0xfff8fafc),
      border: const Color(0xffe2e8f0),
      input: const Color(0xffe2e8f0),
      ring: const Color(0xff2563eb),
      selection: const Color(0xFFB4D7FF),
    );
  }

  /// Returns the [AppColorScheme] for the dark theme.
  factory AppColorScheme.dark() {
    return AppColorScheme(
      background: const Color(0xff020817),
      foreground: const Color(0xfff8fafc),
      card: const Color(0xff020817),
      cardForeground: const Color(0xfff8fafc),
      popover: const Color(0xff020817),
      popoverForeground: const Color(0xfff8fafc),
      primary: const Color(0xff3b82f6),
      primaryForeground: const Color(0xff0f172a),
      secondary: const Color(0xff1e293b),
      secondaryForeground: const Color(0xfff8fafc),
      muted: const Color(0xff1e293b),
      mutedForeground: const Color(0xff94a3b8),
      accent: const Color(0xff1e293b),
      accentForeground: const Color(0xfff8fafc),
      destructive: const Color(0xffef4444),
      destructiveForeground: const Color(0xfff8fafc),
      border: const Color(0xff1e293b),
      input: const Color(0xff1e293b),
      ring: const Color(0xff1d4ed8),
      selection: const Color(0xFF355172),
    );
  }

  /// Returns the [ColorScheme] from the app color scheme.
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: primaryForeground,
      secondary: secondary,
      onSecondary: secondaryForeground,
      error: destructive,
      onError: destructiveForeground,
      surface: background,
      onSurface: foreground,
    );
  }
}
