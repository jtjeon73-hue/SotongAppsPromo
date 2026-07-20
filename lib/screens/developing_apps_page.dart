import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../layout/page_scaffold.dart';
import '../widgets/app_project_card.dart';
import '../widgets/app_roadmap_section.dart';
import '../widgets/responsive_card_grid.dart';
import '../widgets/section_title.dart';

class DevelopingAppsPage extends StatelessWidget {
  const DevelopingAppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final developing = sampleApps.where((app) => !app.isPromoLive).toList();

    return PageScaffoldBody(
      children: [
        SectionContainer(
          id: 'developing',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '개발 중인 앱',
                subtitle: '고도화·구상·기획 단계의 앱과 향후 확장 아이디어입니다.',
              ),
              const SizedBox(height: 32),
              if (developing.isEmpty)
                Text(
                  '개발 중으로 분류된 앱이 없습니다.',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              else
                ResponsiveCardGrid(
                  itemCount: developing.length,
                  minCardWidth: 360,
                  maxColumns: 2,
                  spacing: 24,
                  itemBuilder: (context, index) =>
                      AppProjectCard(project: developing[index]),
                ),
            ],
          ),
        ),
        const AppRoadmapSection(),
      ],
    );
  }
}
