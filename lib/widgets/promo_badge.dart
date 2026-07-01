import 'package:flutter/material.dart';

import '../models/app_project.dart';
import '../theme/promo_theme.dart';

enum PromoBadgeStyle {
  hero,
  status,
  promoLive,
  promoPlanned,
  promoPending,
  category,
  tag,
}

/// 앱 프로모 공통 배지 — 베이지·골드 톤
class PromoBadge extends StatefulWidget {
  const PromoBadge({
    super.key,
    required this.label,
    this.style = PromoBadgeStyle.tag,
    this.fontSize,
  });

  final String label;
  final PromoBadgeStyle style;
  final double? fontSize;

  factory PromoBadge.promoStatus(String promoStatus) {
    if (promoStatus == PromoStatus.live) {
      return PromoBadge(label: promoStatus, style: PromoBadgeStyle.promoLive);
    }
    if (promoStatus == PromoStatus.planned) {
      return PromoBadge(
        label: promoStatus,
        style: PromoBadgeStyle.promoPlanned,
      );
    }
    return PromoBadge(label: promoStatus, style: PromoBadgeStyle.promoPending);
  }

  @override
  State<PromoBadge> createState() => _PromoBadgeState();
}

class _PromoBadgeState extends State<PromoBadge> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = _resolveColors();
    final fontSize = widget.fontSize ?? _defaultFontSize(context);

    return MouseRegion(
      onEnter: widget.style == PromoBadgeStyle.hero
          ? (_) => setState(() => _hovered = true)
          : null,
      onExit: widget.style == PromoBadgeStyle.hero
          ? (_) => setState(() => _hovered = false)
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: widget.style == PromoBadgeStyle.hero && _hovered
              ? PromoColors.badgeBackgroundHover
              : colors.background,
          borderRadius: BorderRadius.circular(
            widget.style == PromoBadgeStyle.status ? 8 : 20,
          ),
          border: Border.all(color: colors.border, width: 1.1),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: colors.foreground,
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            height: 1.35,
          ),
          softWrap: true,
        ),
      ),
    );
  }

  double _defaultFontSize(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 600 ? 12 : 13;
  }

  _BadgeColors _resolveColors() {
    switch (widget.style) {
      case PromoBadgeStyle.hero:
        return _BadgeColors(
          background: PromoColors.badgeBackground,
          foreground: PromoColors.badgeText,
          border: PromoColors.gold.withValues(alpha: 0.65),
        );
      case PromoBadgeStyle.status:
        return _BadgeColors(
          background: PromoColors.badgeBackgroundAlt,
          foreground: PromoColors.badgeText,
          border: PromoColors.gold,
        );
      case PromoBadgeStyle.promoLive:
        return _BadgeColors(
          background: PromoColors.badgeBackground,
          foreground: PromoColors.deepNavy,
          border: PromoColors.gold.withValues(alpha: 0.7),
        );
      case PromoBadgeStyle.promoPlanned:
        return const _BadgeColors(
          background: PromoColors.badgeBackgroundAlt,
          foreground: Color(0xFF92400E),
          border: Color(0xFFE8D5A3),
        );
      case PromoBadgeStyle.promoPending:
        return _BadgeColors(
          background: PromoColors.beige,
          foreground: PromoColors.textSecondary,
          border: PromoColors.beigeDark,
        );
      case PromoBadgeStyle.category:
        return _BadgeColors(
          background: PromoColors.beige,
          foreground: PromoColors.charcoal,
          border: PromoColors.beigeDark,
        );
      case PromoBadgeStyle.tag:
        return _BadgeColors(
          background: PromoColors.badgeBackground,
          foreground: PromoColors.deepNavy,
          border: PromoColors.gold.withValues(alpha: 0.5),
        );
    }
  }
}

class _BadgeColors {
  const _BadgeColors({
    required this.background,
    required this.foreground,
    required this.border,
  });

  final Color background;
  final Color foreground;
  final Color border;
}
