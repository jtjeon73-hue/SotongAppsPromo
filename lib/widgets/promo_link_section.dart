import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../models/app_category.dart';
import '../models/app_project.dart';
import '../theme/promo_theme.dart';
import '../utils/url_helper.dart';
import 'section_title.dart';

class PromoLinkSection extends StatelessWidget {
  const PromoLinkSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columns = gridColumns(width, max: 3);

    return SectionContainer(
      child: Column(
        children: [
          const SectionTitle(
            title: '앱별 프로모 사이트',
            subtitle:
                '각 앱은 개별 프로모 사이트와 연결되어, 사용자가 앱의 목적과 기능을 쉽게 이해할 수 있도록 구성됩니다.',
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFED7AA)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.info_outline_rounded,
                  size: 18,
                  color: Color(0xFFEA580C),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    promoDeployNotice,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: const Color(0xFF9A3412),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: columns >= 2 ? 1.45 : 1.35,
            ),
            itemCount: promoLinks.length,
            itemBuilder: (context, index) {
              final link = promoLinks[index];
              return _PromoLinkCard(link: link);
            },
          ),
        ],
      ),
    );
  }
}

class _PromoLinkCard extends StatelessWidget {
  const _PromoLinkCard({required this.link});

  final PromoLink link;

  Color _statusColor() {
    if (link.isPromoLive) return PromoTheme.tealDark;
    if (link.promoStatus == PromoStatus.planned) {
      return const Color(0xFFD97706);
    }
    return PromoTheme.mutedGray;
  }

  Future<void> _openLink() async {
    if (!link.canOpen) return;
    await launchExternalUrl(link.url!);
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor();
    final canOpen = link.canOpen;

    return Container(
      decoration: PromoTheme.cardShadow.copyWith(
        border: Border.all(
          color: canOpen
              ? statusColor.withValues(alpha: 0.35)
              : const Color(0xFFE2E8F0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  canOpen ? Icons.link_rounded : Icons.hourglass_empty_rounded,
                  color: canOpen ? statusColor : PromoTheme.mutedGray,
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
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 13,
                color: canOpen ? PromoTheme.tealDark : PromoTheme.mutedGray,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                link.promoStatus,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: statusColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: canOpen
                  ? (link.isPromoLive
                        ? ElevatedButton.icon(
                            onPressed: _openLink,
                            icon: const Icon(
                              Icons.open_in_new_rounded,
                              size: 18,
                            ),
                            label: Text(link.buttonText),
                          )
                        : OutlinedButton.icon(
                            onPressed: _openLink,
                            icon: const Icon(Icons.link_rounded, size: 18),
                            label: Text(link.buttonText),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: PromoTheme.deepNavy,
                              side: const BorderSide(
                                color: PromoTheme.tealDark,
                              ),
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
                      child: Text(link.buttonText),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
