import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../layout/page_scaffold.dart';
import '../widgets/app_category_card.dart';
import '../widgets/responsive_card_grid.dart';
import '../widgets/section_title.dart';

class FeaturesPage extends StatelessWidget {
  const FeaturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffoldBody(
      children: [
        SectionContainer(
          id: 'categories',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '확장 가능한 앱 카테고리',
                subtitle: '새로운 앱 아이디어가 생기면 카테고리별로 계속 확장할 수 있습니다.',
              ),
              const SizedBox(height: 40),
              ResponsiveCardGrid(
                itemCount: appCategories.length,
                minCardWidth: 240,
                maxColumns: 4,
                itemBuilder: (context, index) =>
                    AppCategoryCard(category: appCategories[index]),
              ),
            ],
          ),
        ),
        SectionContainer(
          alternate: true,
          id: 'monetization',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '앱 수익화 방향',
                subtitle: '광고, 유료 기능, 구독, 제휴 등 수익 모델을 검토합니다.',
              ),
              const SizedBox(height: 40),
              ResponsiveCardGrid(
                itemCount: monetizationCards.length,
                minCardWidth: 280,
                maxColumns: 3,
                itemBuilder: (context, index) =>
                    MonetizationCardWidget(card: monetizationCards[index]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
