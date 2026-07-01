import 'package:flutter/material.dart';

import '../models/app_project.dart';
import '../theme/promo_theme.dart';
import '../utils/url_helper.dart';
import 'promo_badge.dart';

class AppProjectCard extends StatelessWidget {
  const AppProjectCard({super.key, required this.project});

  final AppProject project;

  static const int _maxVisibleFeatures = 6;

  Future<void> _openPromo() async {
    if (!project.canOpenPromo) return;
    await launchExternalUrl(project.promoUrl!);
  }

  @override
  Widget build(BuildContext context) {
    final visibleFeatures = project.features.length > _maxVisibleFeatures
        ? project.features.take(_maxVisibleFeatures).toList()
        : project.features;
    final hiddenCount = project.features.length - visibleFeatures.length;

    return Container(
      decoration: PromoTheme.cardShadow,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardHeader(project: project),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoChip(label: '카테고리', value: project.category),
                const SizedBox(height: 10),
                _InfoChip(label: '현재 단계', value: project.stage),
                const SizedBox(height: 16),
                Text(
                  project.description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(height: 1.65),
                ),
                const SizedBox(height: 20),
                Text(
                  '주요 기능',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 15),
                ),
                const SizedBox(height: 10),
                ...visibleFeatures.map(_featureRow),
                if (hiddenCount > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '외 $hiddenCount개 기능',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: PromoTheme.mutedGray,
                      ),
                    ),
                  ),
                if (project.nextStep != null) ...[
                  const SizedBox(height: 16),
                  _NoteBox(
                    icon: Icons.arrow_forward_rounded,
                    iconColor: PromoColors.gold,
                    background: PromoColors.beige,
                    child: Text(
                      '다음 작업: ${project.nextStep}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
                if (project.cautionNote != null) ...[
                  const SizedBox(height: 12),
                  _NoteBox(
                    icon: Icons.info_outline_rounded,
                    iconColor: const Color(0xFFEA580C),
                    background: const Color(0xFFFFF7ED),
                    border: const Color(0xFFFED7AA),
                    child: Text(
                      project.cautionNote!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 13,
                        color: const Color(0xFF9A3412),
                      ),
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                _buildPromoButton(context),
                if (project.isPromoPlanned) ...[
                  const SizedBox(height: 10),
                  Text(
                    '배포 전 링크 — 페이지가 아직 없을 수 있습니다.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: PromoTheme.mutedGray,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureRow(String feature) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle_outline_rounded,
            size: 18,
            color: PromoColors.gold,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              feature,
              style: const TextStyle(fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoButton(BuildContext context) {
    if (!project.canOpenPromo) {
      return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
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
          child: const Text('준비 중'),
        ),
      );
    }

    if (project.isPromoLive) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: _openPromo,
          icon: const Icon(Icons.open_in_new_rounded, size: 18),
          label: Text(project.buttonText),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: _openPromo,
        icon: const Icon(Icons.link_rounded, size: 18),
        label: Text(project.buttonText),
        style: OutlinedButton.styleFrom(
          foregroundColor: PromoColors.deepNavy,
          side: const BorderSide(color: PromoColors.gold),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({required this.project});

  final AppProject project;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [PromoColors.deepNavy, PromoColors.charcoal],
        ),
      ),
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
                  color: PromoColors.gold.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: PromoColors.gold.withValues(alpha: 0.5),
                  ),
                ),
                child: Center(
                  child: Text(
                    project.name[0],
                    style: const TextStyle(
                      color: PromoColors.goldLight,
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
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      project.englishName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: PromoColors.goldLight,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              PromoBadge(label: project.status, style: PromoBadgeStyle.status),
              if (project.hasPromoUrl)
                PromoBadge.promoStatus(project.promoStatus),
            ],
          ),
        ],
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

class _NoteBox extends StatelessWidget {
  const _NoteBox({
    required this.icon,
    required this.iconColor,
    required this.background,
    required this.child,
    this.border,
  });

  final IconData icon;
  final Color iconColor;
  final Color background;
  final Widget child;
  final Color? border;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
        border: border != null ? Border.all(color: border!) : null,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: iconColor),
          const SizedBox(width: 8),
          Expanded(child: child),
        ],
      ),
    );
  }
}
