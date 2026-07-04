import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../models/app_project.dart';
import '../theme/promo_theme.dart';
import '../widgets/app_category_card.dart';
import '../widgets/app_project_card.dart';
import '../widgets/app_roadmap_section.dart';
import '../widgets/sotong_control_hub_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/development_process_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/promo_link_section.dart';
import '../widgets/responsive_card_grid.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _portfolioKey = GlobalKey();
  final _developingKey = GlobalKey();
  final _hubKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        alignment: 0.05,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: HeroSection(
                onPortfolioTap: () => _scrollTo(_portfolioKey),
                onDevelopingTap: () => _scrollTo(_developingKey),
                onContactTap: () => _scrollTo(_hubKey),
              ),
            ),
            SliverToBoxAdapter(
              child: SectionContainer(
                id: 'direction',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionTitle(
                      title: '소통웨어가 만드는 앱의 방향',
                      subtitle: '생활밀착형 AI 앱을 단계적으로 기획·개발·확장하는 6가지 방향입니다.',
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
            ),
            SliverToBoxAdapter(
              key: _portfolioKey,
              child: SectionContainer(
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
            ),
            SliverToBoxAdapter(
              child: SectionContainer(
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
            ),
            const SliverToBoxAdapter(child: DevelopmentProcessSection()),
            const SliverToBoxAdapter(child: PromoLinkSection()),
            SliverToBoxAdapter(
              child: SectionContainer(
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
                      itemBuilder: (context, index) => MonetizationCardWidget(
                        card: monetizationCards[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              key: _developingKey,
              child: const AppRoadmapSection(),
            ),
            SliverToBoxAdapter(
              key: _hubKey,
              child: const SotongControlHubSection(),
            ),
            SliverToBoxAdapter(key: _contactKey, child: const ContactSection()),
            const SliverToBoxAdapter(child: FooterSection()),
          ],
        ),
      ),
    );
  }
}
