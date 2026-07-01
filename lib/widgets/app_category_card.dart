import 'package:flutter/material.dart';

import '../models/app_category.dart';
import '../theme/promo_theme.dart';
import 'promo_badge.dart';

class AppCategoryCard extends StatelessWidget {
  const AppCategoryCard({super.key, required this.category});

  final AppCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardShadow.copyWith(
        border: Border.all(color: category.accentColor.withValues(alpha: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: category.accentColor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(category.icon, color: category.accentColor, size: 26),
            ),
            const SizedBox(height: 16),
            Text(
              category.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              category.description,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 16),
            const PromoBadge(label: '새 앱 추가 가능', style: PromoBadgeStyle.tag),
          ],
        ),
      ),
    );
  }
}

class DevelopmentDirectionCard extends StatelessWidget {
  const DevelopmentDirectionCard({super.key, required this.direction});

  final DevelopmentDirection direction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardShadow,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: PromoColors.gold.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                direction.icon,
                color: PromoColors.deepNavy,
                size: 24,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              direction.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              direction.description,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 14, height: 1.65),
            ),
          ],
        ),
      ),
    );
  }
}

class MonetizationCardWidget extends StatelessWidget {
  const MonetizationCardWidget({super.key, required this.card});

  final MonetizationCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardShadow,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(card.icon, color: PromoColors.gold, size: 28),
            const SizedBox(height: 14),
            Text(card.title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 14),
            const PromoBadge(label: '수익 모델', style: PromoBadgeStyle.category),
            const SizedBox(height: 8),
            Text(
              card.description,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 14, height: 1.65),
            ),
          ],
        ),
      ),
    );
  }
}
