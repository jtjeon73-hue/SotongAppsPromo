import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/sample_apps_data.dart';
import '../layout/page_scaffold.dart';
import '../theme/promo_theme.dart';
import '../widgets/app_category_card.dart';
import '../widgets/hero_section.dart';
import '../widgets/responsive_card_grid.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffoldBody(
      children: [
        HeroSection(
          onPortfolioTap: () => context.go('/apps'),
          onDevelopingTap: () => context.go('/developing'),
          onContactTap: () => context.go('/contact'),
        ),
        SectionContainer(
          id: 'home-direction-preview',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '소통웨어가 만드는 앱의 방향',
                subtitle: '생활밀착형 AI 앱을 단계적으로 기획·개발·확장합니다.',
              ),
              const SizedBox(height: 32),
              ResponsiveCardGrid(
                itemCount: developmentDirections.take(3).length,
                minCardWidth: 280,
                maxColumns: 3,
                itemBuilder: (context, index) => DevelopmentDirectionCard(
                  direction: developmentDirections[index],
                ),
              ),
              const SizedBox(height: 28),
              Align(
                alignment: Alignment.centerLeft,
                child: OutlinedButton.icon(
                  onPressed: () => context.go('/about'),
                  icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                  label: const Text('소통앱 소개 더 보기'),
                ),
              ),
            ],
          ),
        ),
        SectionContainer(
          alternate: true,
          id: 'home-apps-preview',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '대표 앱 미리보기',
                subtitle: '전체 포트폴리오와 출시·개발 중인 앱을 메뉴에서 바로 확인할 수 있습니다.',
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  FilledButton.icon(
                    onPressed: () => context.go('/apps'),
                    style: FilledButton.styleFrom(
                      backgroundColor: PromoColors.deepNavy,
                    ),
                    icon: const Icon(Icons.apps_rounded, size: 18),
                    label: const Text('전체 앱'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => context.go('/launched'),
                    icon: const Icon(Icons.rocket_launch_outlined, size: 18),
                    label: const Text('출시 앱'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => context.go('/developing'),
                    icon: const Icon(Icons.construction_outlined, size: 18),
                    label: const Text('개발 중인 앱'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
