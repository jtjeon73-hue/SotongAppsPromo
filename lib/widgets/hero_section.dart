import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../theme/promo_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onPortfolioTap,
    required this.onDevelopingTap,
    required this.onContactTap,
  });

  final VoidCallback onPortfolioTap;
  final VoidCallback onDevelopingTap;
  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width >= 900;

    return Container(
      width: double.infinity,
      decoration: PromoTheme.heroGradient,
      child: Stack(
        children: [
          Positioned(
            top: -80,
            right: -40,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    PromoTheme.purple.withValues(alpha: 0.25),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -60,
            left: -20,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    PromoTheme.teal.withValues(alpha: 0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isWide ? 48 : 24,
              vertical: isWide ? 96 : 72,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: const Text(
                        'Sotong Apps Lab',
                        style: TextStyle(
                          color: PromoTheme.teal,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '소통웨어 앱개발',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: isWide ? 52 : 36,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'AI와 생활밀착 아이디어를 앱으로 만듭니다',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: PromoTheme.teal,
                        fontSize: isWide ? 24 : 20,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 760),
                      child: Text(
                        '소통웨어 앱개발은 여행, 농촌, 건강, 사주, AI 활용, 지역 생활 서비스를 중심으로 '
                        '실제 사람들이 쓰기 쉬운 앱을 기획하고 개발하는 앱 포트폴리오입니다.\n'
                        'Flutter 기반 앱 개발, Android APK 테스트, Play Store 배포 준비, 개별 프로모 사이트 제작까지 '
                        '앱 출시 흐름 전체를 단계적으로 만들어갑니다.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withValues(alpha: 0.82),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        ElevatedButton.icon(
                          onPressed: onPortfolioTap,
                          icon: const Icon(Icons.grid_view_rounded, size: 20),
                          label: const Text('앱 포트폴리오 보기'),
                        ),
                        OutlinedButton.icon(
                          onPressed: onDevelopingTap,
                          icon: const Icon(
                            Icons.construction_outlined,
                            size: 20,
                          ),
                          label: const Text('개발 중인 앱 보기'),
                        ),
                        OutlinedButton.icon(
                          onPressed: onContactTap,
                          icon: const Icon(
                            Icons.mail_outline_rounded,
                            size: 20,
                          ),
                          label: const Text('문의하기'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: heroBadges
                          .map(
                            (badge) => Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(999),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.15),
                                ),
                              ),
                              child: Text(
                                badge,
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.9),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
