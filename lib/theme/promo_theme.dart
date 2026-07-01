import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// 소통전자책 총괄 프로모와 동일한 베이지·골드·딥네이비 팔레트
class PromoColors {
  static const Color deepNavy = Color(0xFF0F1B2D);
  static const Color charcoal = Color(0xFF2C3E50);
  static const Color beige = Color(0xFFF5F0E8);
  static const Color beigeDark = Color(0xFFE8DFD0);
  static const Color gold = Color(0xFFC9A962);
  static const Color goldLight = Color(0xFFE8D5A3);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A2332);
  static const Color textSecondary = Color(0xFF5A6577);
  static const Color cardSurface = Color(0xFFFAFAF8);
  static const Color badgeBackground = Color(0xFFFFF8EA);
  static const Color badgeBackgroundAlt = Color(0xFFF7E8C6);
  static const Color badgeBackgroundHover = Color(0xFFF3D58A);
  static const Color badgeText = Color(0xFF132033);
}

class PromoTheme {
  PromoTheme._();

  // 기존 코드 호환 — 실제 색은 베이지·골드 계열로 매핑
  static const Color deepNavy = PromoColors.deepNavy;
  static const Color navyMid = PromoColors.charcoal;
  static const Color navyLight = PromoColors.charcoal;
  static const Color teal = PromoColors.gold;
  static const Color tealDark = PromoColors.gold;
  static const Color purple = PromoColors.goldLight;
  static const Color purpleDark = PromoColors.gold;
  static const Color softGray = PromoColors.beige;
  static const Color mutedGray = PromoColors.textSecondary;
  static const Color textPrimary = PromoColors.textPrimary;
  static const Color textSecondary = PromoColors.textSecondary;
  static const Color cardWhite = PromoColors.white;

  static ThemeData lightTheme() {
    final baseText = GoogleFonts.notoSansKrTextTheme();

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: PromoColors.beige,
      colorScheme: ColorScheme.fromSeed(
        seedColor: PromoColors.deepNavy,
        primary: PromoColors.deepNavy,
        secondary: PromoColors.gold,
        surface: PromoColors.beige,
        onPrimary: PromoColors.white,
        onSecondary: PromoColors.deepNavy,
        onSurface: PromoColors.textPrimary,
      ),
      textTheme: baseText.copyWith(
        displayLarge: baseText.displayLarge?.copyWith(
          fontWeight: FontWeight.w700,
          color: PromoColors.white,
          height: 1.2,
        ),
        displayMedium: baseText.displayMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: PromoColors.textPrimary,
          height: 1.25,
        ),
        headlineMedium: baseText.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
          color: PromoColors.textPrimary,
        ),
        titleLarge: baseText.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: PromoColors.textPrimary,
        ),
        titleMedium: baseText.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: PromoColors.textPrimary,
        ),
        bodyLarge: baseText.bodyLarge?.copyWith(
          color: PromoColors.textSecondary,
          height: 1.7,
        ),
        bodyMedium: baseText.bodyMedium?.copyWith(
          color: PromoColors.textSecondary,
          height: 1.65,
        ),
        labelLarge: baseText.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: PromoColors.deepNavy,
        ),
      ),
      cardTheme: CardThemeData(
        color: PromoColors.cardSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: PromoColors.beigeDark.withValues(alpha: 0.8)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: PromoColors.deepNavy,
          foregroundColor: PromoColors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.notoSansKr(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: PromoColors.deepNavy,
          side: const BorderSide(color: PromoColors.gold, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.notoSansKr(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  static BoxDecoration get heroGradient => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        PromoColors.deepNavy,
        PromoColors.charcoal,
        PromoColors.deepNavy.withValues(alpha: 0.95),
      ],
    ),
  );

  static BoxDecoration get cardShadow => BoxDecoration(
    color: PromoColors.cardSurface,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: PromoColors.beigeDark.withValues(alpha: 0.8)),
    boxShadow: [
      BoxShadow(
        color: PromoColors.deepNavy.withValues(alpha: 0.06),
        blurRadius: 24,
        offset: const Offset(0, 8),
      ),
    ],
  );

  static BoxDecoration get sectionGradient => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [PromoColors.beige, PromoColors.white, PromoColors.beige],
    ),
  );
}
