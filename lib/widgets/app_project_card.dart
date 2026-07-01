import 'package:flutter/material.dart';

import '../models/app_project.dart';
import '../theme/promo_theme.dart';
import '../utils/url_helper.dart';

class AppProjectCard extends StatelessWidget {
  const AppProjectCard({super.key, required this.project});

  final AppProject project;

  Color _badgeColor(String badge) {
    if (badge.contains('진행')) return PromoTheme.tealDark;
    if (badge.contains('기획') || badge.contains('아이디어')) {
      return PromoTheme.purple;
    }
    if (badge.contains('고도화')) return PromoTheme.purpleDark;
    return PromoTheme.navyLight;
  }

  Color _promoStatusColor() {
    if (project.isPromoLive) return PromoTheme.tealDark;
    if (project.isPromoPlanned) return const Color(0xFFD97706);
    return PromoTheme.mutedGray;
  }

  Future<void> _openPromo() async {
    if (!project.canOpenPromo) return;
    await launchExternalUrl(project.promoUrl!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: PromoTheme.cardShadow,
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [PromoTheme.tealDark, PromoTheme.purple],
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      project.name[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
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
                        project.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        project.englishName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: PromoTheme.mutedGray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: _badgeColor(
                          project.status,
                        ).withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        project.status,
                        style: TextStyle(
                          color: _badgeColor(project.status),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (project.hasPromoUrl) ...[
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: _promoStatusColor().withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          project.promoStatus,
                          style: TextStyle(
                            color: _promoStatusColor(),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            _InfoChip(label: '카테고리', value: project.category),
            const SizedBox(height: 8),
            _InfoChip(label: '현재 단계', value: project.stage),
            const SizedBox(height: 16),
            Text(
              project.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text(
              '주요 기능',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontSize: 15),
            ),
            const SizedBox(height: 10),
            ...project.features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      size: 18,
                      color: PromoTheme.tealDark,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        feature,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (project.nextStep != null) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: PromoTheme.softGray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: 18,
                      color: PromoTheme.purple,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '다음 작업: ${project.nextStep}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (project.cautionNote != null) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
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
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        project.cautionNote!,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                          color: const Color(0xFF9A3412),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: project.canOpenPromo
                  ? (project.isPromoLive
                        ? ElevatedButton.icon(
                            onPressed: _openPromo,
                            icon: const Icon(
                              Icons.open_in_new_rounded,
                              size: 18,
                            ),
                            label: Text(project.buttonText),
                          )
                        : OutlinedButton.icon(
                            onPressed: _openPromo,
                            icon: const Icon(Icons.link_rounded, size: 18),
                            label: Text(project.buttonText),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: PromoTheme.deepNavy,
                              side: const BorderSide(
                                color: PromoTheme.tealDark,
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                          ))
                  : OutlinedButton(
                      onPressed: null,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: PromoTheme.mutedGray,
                        disabledForegroundColor: PromoTheme.mutedGray,
                        side: const BorderSide(color: Color(0xFFE2E8F0)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(project.buttonText),
                    ),
            ),
            if (project.isPromoPlanned) ...[
              const SizedBox(height: 10),
              Text(
                '배포 전 링크 — 페이지가 아직 없을 수 있습니다.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12,
                  color: PromoTheme.mutedGray,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 72,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 13,
              color: PromoTheme.mutedGray,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: PromoTheme.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
