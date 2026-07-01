import 'package:flutter/material.dart';

import '../theme/promo_theme.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.light = false,
    this.center = true,
  });

  final String title;
  final String? subtitle;
  final bool light;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final titleColor = light ? Colors.white : PromoTheme.textPrimary;
    final subtitleColor = light
        ? Colors.white.withValues(alpha: 0.78)
        : PromoTheme.textSecondary;

    return Column(
      crossAxisAlignment: center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: center ? TextAlign.center : TextAlign.start,
          style: Theme.of(
            context,
          ).textTheme.displayMedium?.copyWith(fontSize: 32, color: titleColor),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(
              subtitle!,
              textAlign: center ? TextAlign.center : TextAlign.start,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: subtitleColor,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
