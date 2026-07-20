import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../layout/page_scaffold.dart';
import '../widgets/app_project_card.dart';
import '../widgets/responsive_card_grid.dart';
import '../widgets/section_title.dart';

class LaunchedAppsPage extends StatelessWidget {
  const LaunchedAppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final launched = sampleApps.where((app) => app.isPromoLive).toList();

    return PageScaffoldBody(
      children: [
        SectionContainer(
          id: 'launched',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '출시 앱',
                subtitle: '프로모 사이트가 운영 중인 앱입니다. 링크에서 바로 확인할 수 있습니다.',
              ),
              const SizedBox(height: 32),
              if (launched.isEmpty)
                const _EmptyNotice(
                  message:
                      '현재 운영 중으로 표시된 출시 앱이 없습니다. 전체 앱 메뉴에서 포트폴리오를 확인해 주세요.',
                )
              else
                ResponsiveCardGrid(
                  itemCount: launched.length,
                  minCardWidth: 360,
                  maxColumns: 2,
                  spacing: 24,
                  itemBuilder: (context, index) =>
                      AppProjectCard(project: launched[index]),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EmptyNotice extends StatelessWidget {
  const _EmptyNotice({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Text(message, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
