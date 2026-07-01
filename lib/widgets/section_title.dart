import 'package:flutter/material.dart';

import '../theme/promo_theme.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.light = false,
    this.center = false,
  });

  final String title;
  final String? subtitle;
  final bool light;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final titleColor = light ? Colors.white : PromoTheme.textPrimary;
    final subtitleColor = light
        ? Colors.white.withValues(alpha: 0.82)
        : PromoTheme.textSecondary;
    final crossAlign = center
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
    final textAlign = center ? TextAlign.center : TextAlign.start;

    return Column(
      crossAxisAlignment: crossAlign,
      children: [
        if (!light)
          Align(
            alignment: center ? Alignment.center : Alignment.centerLeft,
            child: Container(
              width: 48,
              height: 3,
              decoration: BoxDecoration(
                color: PromoColors.gold,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        if (!light) const SizedBox(height: 16),
        Text(
          title,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: titleColor,
            fontSize: _titleSize(context),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              subtitle!,
              textAlign: textAlign,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: subtitleColor,
                fontSize: _subtitleSize(context),
              ),
            ),
          ),
        ],
      ],
    );
  }

  double _titleSize(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 600) return 26;
    if (width < 900) return 30;
    return 32;
  }

  double _subtitleSize(BuildContext context) {
    return MediaQuery.sizeOf(context).width < 600 ? 15 : 16;
  }
}

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.alternate = false,
    this.id,
    this.backgroundColor,
  });

  final Widget child;
  final bool alternate;
  final String? id;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final bg =
        backgroundColor ?? (alternate ? PromoColors.beige : PromoColors.white);

    return Container(
      key: id != null ? Key(id!) : null,
      width: double.infinity,
      color: bg,
      padding: EdgeInsets.symmetric(
        horizontal: _horizontalPadding(context),
        vertical: _verticalPadding(context),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }

  double _horizontalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < 600) return 20;
    if (width < 900) return 32;
    return 48;
  }

  double _verticalPadding(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width < 600 ? 56 : 80;
  }
}
