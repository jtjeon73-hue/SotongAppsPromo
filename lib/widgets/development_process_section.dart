import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../models/app_category.dart';
import '../theme/promo_theme.dart';
import 'section_title.dart';

class DevelopmentProcessSection extends StatelessWidget {
  const DevelopmentProcessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      alternate: true,
      id: 'development-process',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: '앱 개발 진행 방식',
            subtitle: '아이디어부터 APK 테스트, 프로모 사이트, Play Store까지 단계적으로 확장합니다.',
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 800) {
                return _buildTimeline(context);
              }
              return _buildMobileList(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < processSteps.length; i++) ...[
          _StepCard(step: processSteps[i]),
          if (i < processSteps.length - 1)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const SizedBox(width: 22),
                  Container(
                    width: 2,
                    height: 24,
                    color: PromoColors.gold.withValues(alpha: 0.4),
                  ),
                ],
              ),
            ),
        ],
      ],
    );
  }

  Widget _buildMobileList(BuildContext context) {
    return Column(
      children: processSteps
          .map(
            (step) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _StepCard(step: step),
            ),
          )
          .toList(),
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({required this.step});

  final ProcessStep step;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardShadow,
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: PromoColors.deepNavy,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                '${step.step}',
                style: const TextStyle(
                  color: PromoColors.gold,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  step.description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 14, height: 1.65),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
