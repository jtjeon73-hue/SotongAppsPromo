import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../layout/page_scaffold.dart';
import '../widgets/app_category_card.dart';
import '../widgets/responsive_card_grid.dart';
import '../widgets/section_title.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffoldBody(
      children: [
        SectionContainer(
          id: 'about',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '소통앱 소개',
                subtitle:
                    '소통웨어 앱개발은 여행, 농촌, 건강, 사주, AI 활용, 지역 생활 서비스를 중심으로 '
                    '실제 사람들이 쓰기 쉬운 앱을 기획하고 개발하는 앱 포트폴리오입니다.',
              ),
              const SizedBox(height: 40),
              ResponsiveCardGrid(
                itemCount: developmentDirections.length,
                minCardWidth: 300,
                maxColumns: 3,
                itemBuilder: (context, index) => DevelopmentDirectionCard(
                  direction: developmentDirections[index],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
