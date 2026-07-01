import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../models/app_project.dart';
import '../theme/promo_theme.dart';
import '../utils/url_helper.dart';
import '../widgets/app_category_card.dart';
import '../widgets/app_project_card.dart';
import '../widgets/app_roadmap_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/development_process_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/promo_link_section.dart';
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
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SelectionArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: HeroSection(
                onPortfolioTap: () => _scrollTo(_portfolioKey),
                onDevelopingTap: () => _scrollTo(_developingKey),
                onContactTap: () => _scrollTo(_contactKey),
              ),
            ),
            SliverToBoxAdapter(child: _buildDirectionSection(width)),
            SliverToBoxAdapter(
              key: _portfolioKey,
              child: _buildPortfolioSection(width),
            ),
            SliverToBoxAdapter(child: _buildCategorySection(width)),
            const SliverToBoxAdapter(child: DevelopmentProcessSection()),
            const SliverToBoxAdapter(child: PromoLinkSection()),
            SliverToBoxAdapter(child: _buildMonetizationSection(width)),
            SliverToBoxAdapter(
              key: _developingKey,
              child: const AppRoadmapSection(),
            ),
            SliverToBoxAdapter(key: _contactKey, child: const ContactSection()),
            const SliverToBoxAdapter(child: FooterSection()),
          ],
        ),
      ),
    );
  }

  Widget _buildDirectionSection(double width) {
    final columns = gridColumns(width, max: 3);

    return SectionContainer(
      child: Column(
        children: [
          const SectionTitle(title: '소통웨어가 만드는 앱의 방향'),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: columns >= 2 ? 1.15 : 1.05,
            ),
            itemCount: developmentDirections.length,
            itemBuilder: (context, index) {
              return DevelopmentDirectionCard(
                direction: developmentDirections[index],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPortfolioSection(double width) {
    final columns = responsiveColumns(width);

    return SectionContainer(
      backgroundColor: PromoTheme.softGray,
      child: Column(
        children: [
          const SectionTitle(title: '앱 포트폴리오'),
          const SizedBox(height: 16),
          Text(
            promoDeployNotice,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: PromoTheme.mutedGray,
            ),
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: columns == 1 ? 0.55 : 0.62,
            ),
            itemCount: sampleApps.length,
            itemBuilder: (context, index) {
              return AppProjectCard(project: sampleApps[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(double width) {
    final columns = gridColumns(width, max: 4);

    return SectionContainer(
      child: Column(
        children: [
          const SectionTitle(
            title: '확장 가능한 앱 카테고리',
            subtitle: '새로운 앱 아이디어가 생기면 카테고리별로 계속 확장할 수 있습니다.',
          ),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: columns >= 3 ? 1.1 : 1.05,
            ),
            itemCount: appCategories.length,
            itemBuilder: (context, index) {
              return AppCategoryCard(category: appCategories[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMonetizationSection(double width) {
    final columns = gridColumns(width, max: 3);

    return SectionContainer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const SectionTitle(title: '앱 수익화 방향'),
          const SizedBox(height: 48),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: columns >= 2 ? 1.25 : 1.1,
            ),
            itemCount: monetizationCards.length,
            itemBuilder: (context, index) {
              return MonetizationCardWidget(card: monetizationCards[index]);
            },
          ),
        ],
      ),
    );
  }
}
