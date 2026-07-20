import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../layout/page_scaffold.dart';
import '../models/app_project.dart';
import '../theme/promo_theme.dart';
import '../widgets/app_project_card.dart';
import '../widgets/promo_link_section.dart';
import '../widgets/responsive_card_grid.dart';
import '../widgets/section_title.dart';

class AppsPage extends StatelessWidget {
  const AppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffoldBody(
      children: [
        SectionContainer(
          alternate: true,
          id: 'portfolio',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '앱 포트폴리오',
                subtitle: '소통웨어에서 개발 중이거나 준비 중인 앱 포트폴리오입니다.',
              ),
              const SizedBox(height: 16),
              Text(
                promoDeployNotice,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: PromoTheme.mutedGray,
                  height: 1.55,
                ),
              ),
              const SizedBox(height: 32),
              ResponsiveCardGrid(
                itemCount: sampleApps.length,
                minCardWidth: 360,
                maxColumns: 2,
                spacing: 24,
                itemBuilder: (context, index) =>
                    AppProjectCard(project: sampleApps[index]),
              ),
            ],
          ),
        ),
        const PromoLinkSection(),
      ],
    );
  }
}
