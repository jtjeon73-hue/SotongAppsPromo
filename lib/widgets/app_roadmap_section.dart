import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../theme/promo_theme.dart';
import '../utils/url_helper.dart';
import 'section_title.dart';

class AppRoadmapSection extends StatelessWidget {
  const AppRoadmapSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = gridColumns(width, max: 4);

    return SectionContainer(
      backgroundColor: PromoTheme.softGray,
      child: Column(
        children: [
          const SectionTitle(
            title: '계속 확장되는 앱 아이디어',
            subtitle:
                '소통웨어 앱개발은 하나의 앱으로 끝나지 않고, '
                '생활밀착형 AI 앱과 수익형 앱을 계속 추가하는 방향으로 확장됩니다.',
          ),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: columns >= 3 ? 1.8 : 2.2,
            ),
            itemCount: futureIdeas.length,
            itemBuilder: (context, index) {
              final idea = futureIdeas[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: PromoTheme.purple.withValues(alpha: 0.15),
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: PromoTheme.deepNavy.withValues(alpha: 0.04),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(idea.icon, color: PromoTheme.purple, size: 28),
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
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
