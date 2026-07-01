import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../models/app_category.dart';
import '../models/app_project.dart';
import '../theme/promo_theme.dart';
import '../utils/url_helper.dart';
import 'promo_badge.dart';
import 'responsive_card_grid.dart';
import 'section_title.dart';

class PromoLinkSection extends StatelessWidget {
  const PromoLinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      id: 'promo-links',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: '앱별 프로모 사이트',
            subtitle:
                '각 앱은 개별 프로모 사이트와 연결되어, 사용자가 앱의 목적과 기능을 쉽게 이해할 수 있도록 구성됩니다.',
          ),
          const SizedBox(height: 24),
          _NoticeBox(text: promoDeployNotice),
          const SizedBox(height: 32),
          ResponsiveCardGrid(
            itemCount: promoLinks.length,
            minCardWidth: 300,
            maxColumns: 3,
            itemBuilder: (context, index) =>
                _PromoLinkCard(link: promoLinks[index]),
          ),
        ],
      ),
    );
  }
}

class _NoticeBox extends StatelessWidget {
  const _NoticeBox({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: PromoColors.badgeBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: PromoColors.gold.withValues(alpha: 0.4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline_rounded, size: 18, color: PromoColors.gold),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                color: PromoColors.badgeText,
                height: 1.55,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PromoLinkCard extends StatelessWidget {
  const _PromoLinkCard({required this.link});

  final PromoLink link;

  Future<void> _openLink() async {
    if (!link.canOpen) return;
    await launchExternalUrl(link.url!);
  }

  @override
  Widget build(BuildContext context) {
    final canOpen = link.canOpen;

    return Container(
      decoration: PromoTheme.cardShadow.copyWith(
        border: Border.all(
          color: canOpen
              ? PromoColors.gold.withValues(alpha: 0.45)
              : PromoColors.beigeDark,
        ),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                canOpen ? Icons.link_rounded : Icons.hourglass_empty_rounded,
                color: canOpen ? PromoColors.gold : PromoTheme.mutedGray,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  link.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            link.url ?? 'URL 미설정',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: canOpen ? PromoColors.gold : PromoTheme.mutedGray,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          PromoBadge.promoStatus(
            canOpen ? link.promoStatus : PromoStatus.pending,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: canOpen
                ? (link.isPromoLive
                      ? ElevatedButton.icon(
                          onPressed: _openLink,
                          icon: const Icon(Icons.open_in_new_rounded, size: 18),
                          label: Text(link.buttonText),
                        )
                      : OutlinedButton.icon(
                          onPressed: _openLink,
                          icon: const Icon(Icons.link_rounded, size: 18),
                          label: Text(link.buttonText),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: PromoColors.deepNavy,
                            side: const BorderSide(color: PromoColors.gold),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ))
                : OutlinedButton(
                    onPressed: null,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: PromoTheme.mutedGray,
                      side: const BorderSide(color: Color(0xFFE2E8F0)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text('준비 중'),
                  ),
          ),
        ],
      ),
    );
  }
}
