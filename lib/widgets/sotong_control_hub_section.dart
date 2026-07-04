import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/promo_contact.dart';
import '../data/sotong_hub_config.dart';
import '../theme/promo_theme.dart';
import 'section_title.dart';

/// 소통총관제 연동 — 앱개발 프로모 온라인 문의·피드백·지시 흐름
class SotongControlHubSection extends StatelessWidget {
  const SotongControlHubSection({
    super.key,
    this.onInquiry,
    this.onCollaboration,
  });

  final VoidCallback? onInquiry;
  final VoidCallback? onCollaboration;

  Future<void> _defaultInquiry() async {
    await launchUrl(PromoContact.hubInquiryUri());
  }

  Future<void> _defaultCollaboration() async {
    await launchUrl(PromoContact.hubCollaborationUri());
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width > 900;

    return SectionContainer(
      id: 'sotong-hub',
      alternate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _hubBadge(),
          const SizedBox(height: 20),
          const SectionTitle(
            title: '소통총관제 연동 구조',
            subtitle:
                '온라인 고객·협업 파트너의 앱개발 문의는 소통총관제로 접수되고, '
                '검토·피드백·후속 지시까지 하나의 흐름으로 관리됩니다. '
                '본 홍보사이트(SotongAppsPromo)는 소통총관제와 연계된 고객 접점 채널입니다.',
            center: true,
          ),
          const SizedBox(height: 44),
          _flowDiagram(isWide),
          const SizedBox(height: 36),
          isWide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: _ticketPanel(context)),
                    const SizedBox(width: 24),
                    Expanded(flex: 2, child: _instructionPanel(context)),
                  ],
                )
              : Column(
                  children: [
                    _ticketPanel(context),
                    const SizedBox(height: 20),
                    _instructionPanel(context),
                  ],
                ),
          const SizedBox(height: 36),
          _connectionDiagram(isWide),
          const SizedBox(height: 32),
          _ctaRow(context),
        ],
      ),
    );
  }

  Widget _hubBadge() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
        decoration: BoxDecoration(
          color: PromoColors.badgeBackground,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: PromoColors.gold.withValues(alpha: 0.5)),
        ),
        child: const Text(
          'SOTONG CENTRAL COMMAND HUB · APP CHANNEL',
          style: TextStyle(
            color: PromoColors.badgeText,
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.9,
          ),
        ),
      ),
    );
  }

  Widget _flowDiagram(bool isWide) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: PromoColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: PromoColors.beigeDark),
        boxShadow: [
          BoxShadow(
            color: PromoColors.deepNavy.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: isWide
          ? Row(
              children: [
                for (var i = 0; i < SotongHubConfig.flowSteps.length; i++) ...[
                  Expanded(child: _flowStepCard(SotongHubConfig.flowSteps[i])),
                  if (i < SotongHubConfig.flowSteps.length - 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Icon(
                        Icons.arrow_forward,
                        color: PromoColors.gold.withValues(alpha: 0.7),
                        size: 20,
                      ),
                    ),
                ],
              ],
            )
          : Column(
              children: [
                for (var i = 0; i < SotongHubConfig.flowSteps.length; i++) ...[
                  _flowStepCard(SotongHubConfig.flowSteps[i]),
                  if (i < SotongHubConfig.flowSteps.length - 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Icon(
                        Icons.arrow_downward,
                        color: PromoColors.gold.withValues(alpha: 0.7),
                        size: 20,
                      ),
                    ),
                ],
              ],
            ),
    );
  }

  Widget _flowStepCard(HubFlowStep step) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: step.color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: step.color.withValues(alpha: 0.22)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: step.color.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${step.step}',
                  style: TextStyle(
                    color: step.color,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Icon(step.icon, color: step.color, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            step.title,
            style: const TextStyle(
              color: PromoColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            step.description,
            style: const TextStyle(
              color: PromoColors.textSecondary,
              fontSize: 12,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ticketPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: PromoColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: PromoColors.deepNavy.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.inbox_outlined, color: PromoColors.deepNavy, size: 22),
              const SizedBox(width: 10),
              Text(
                '온라인 문의 현황 (${SotongHubConfig.hubName})',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            '실제 고객명 없이 흐름을 보여주는 샘플 화면입니다.',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 18),
          for (final ticket in SotongHubConfig.sampleTickets) ...[
            _ticketRow(ticket),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }

  Widget _ticketRow(HubTicket ticket) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: PromoColors.beige.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: PromoColors.beigeDark),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      ticket.id,
                      style: const TextStyle(
                        color: PromoColors.deepNavy,
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      ticket.type,
                      style: const TextStyle(
                        color: PromoColors.textSecondary,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  ticket.summary,
                  style: const TextStyle(
                    color: PromoColors.textPrimary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: ticket.status.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: ticket.status.color.withValues(alpha: 0.35),
              ),
            ),
            child: Text(
              ticket.status.label,
              style: TextStyle(
                color: ticket.status.color,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _instructionPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [PromoColors.deepNavy, PromoColors.charcoal],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: PromoColors.gold.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.campaign_outlined,
                color: PromoColors.goldLight,
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  '${SotongHubConfig.hubName} 지시 · 피드백',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '총관제에서 내려진 후속 조치와 피드백이 앱개발 채널로 전달되는 구조입니다.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withValues(alpha: 0.75),
              fontSize: 12,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          for (final item in SotongHubConfig.sampleInstructions) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: PromoColors.gold.withValues(alpha: 0.25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_circle_right,
                        size: 14,
                        color: PromoColors.goldLight,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        item.title,
                        style: const TextStyle(
                          color: PromoColors.goldLight,
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.description,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.72),
                      fontSize: 11,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.link, size: 16, color: PromoColors.goldLight),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${SotongHubConfig.siteLabel} → ${PromoContact.email} → ${SotongHubConfig.hubName}',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _connectionDiagram(bool isWide) {
    final nodes = [
      ('SotongAppsPromo', '앱 프로모 사이트', Icons.web_outlined),
      ('온라인 문의', '상담·협업 접수', Icons.mail_outline),
      (SotongHubConfig.hubName, '접수·배정·지시', Icons.hub_outlined),
      ('피드백 채널', '회신·후속 안내', Icons.forum_outlined),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: PromoColors.deepNavy.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: PromoColors.gold.withValues(alpha: 0.25)),
      ),
      child: isWide
          ? Row(
              children: [
                for (var i = 0; i < nodes.length; i++) ...[
                  Expanded(
                    child: _connectionNode(
                      nodes[i].$1,
                      nodes[i].$2,
                      nodes[i].$3,
                    ),
                  ),
                  if (i < nodes.length - 1)
                    Icon(
                      Icons.arrow_forward,
                      color: PromoColors.gold,
                      size: 18,
                    ),
                ],
              ],
            )
          : Column(
              children: [
                for (var i = 0; i < nodes.length; i++) ...[
                  _connectionNode(nodes[i].$1, nodes[i].$2, nodes[i].$3),
                  if (i < nodes.length - 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Icon(
                        Icons.arrow_downward,
                        color: PromoColors.gold,
                        size: 18,
                      ),
                    ),
                ],
              ],
            ),
    );
  }

  Widget _connectionNode(String title, String subtitle, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: PromoColors.white,
            shape: BoxShape.circle,
            border: Border.all(color: PromoColors.gold.withValues(alpha: 0.4)),
          ),
          child: Icon(icon, color: PromoColors.deepNavy, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: PromoColors.textPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: PromoColors.textSecondary,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _ctaRow(BuildContext context) {
    final onInquiryTap = onInquiry ?? _defaultInquiry;
    final onCollabTap = onCollaboration ?? _defaultCollaboration;

    return Center(
      child: Wrap(
        spacing: 14,
        runSpacing: 14,
        alignment: WrapAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: onInquiryTap,
            icon: const Icon(Icons.hub_outlined, size: 20),
            label: const Text('소통총관제 경유 상담 문의'),
            style: ElevatedButton.styleFrom(
              backgroundColor: PromoColors.deepNavy,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
          ),
          OutlinedButton.icon(
            onPressed: onCollabTap,
            icon: const Icon(Icons.handshake_outlined, size: 20),
            label: const Text('협업 · 아이디어 제안 (총관제 접수)'),
            style: OutlinedButton.styleFrom(
              foregroundColor: PromoColors.deepNavy,
              side: const BorderSide(color: PromoColors.gold, width: 1.5),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}
