import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../theme/promo_theme.dart';
import 'responsive_card_grid.dart';
import 'section_title.dart';

class AppRoadmapSection extends StatelessWidget {
  const AppRoadmapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      alternate: true,
      id: 'roadmap',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: '계속 확장되는 앱 아이디어',
            subtitle:
                '소통웨어 앱개발은 하나의 앱으로 끝나지 않고, '
                '생활밀착형 AI 앱과 수익형 앱을 계속 추가하는 방향으로 확장됩니다.',
          ),
          const SizedBox(height: 40),
          ResponsiveCardGrid(
            itemCount: futureIdeas.length,
            minCardWidth: 220,
            maxColumns: 4,
            spacing: 16,
            itemBuilder: (context, index) {
              final idea = futureIdeas[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: PromoColors.gold.withValues(alpha: 0.2),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: PromoTheme.deepNavy.withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(idea.icon, color: PromoColors.gold, size: 28),
                    const SizedBox(height: 12),
                    Text(
                      idea.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(fontSize: 15),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
