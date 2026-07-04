import 'package:flutter/material.dart';

import '../data/promo_contact.dart';
import '../theme/promo_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      id: 'contact',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(48),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [PromoColors.deepNavy, PromoColors.charcoal],
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: PromoTheme.deepNavy.withValues(alpha: 0.2),
              blurRadius: 32,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(
                  color: PromoColors.goldLight.withValues(alpha: 0.5),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'SOTONG HUB · APP INQUIRY',
                style: TextStyle(
                  color: PromoColors.goldLight,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const SectionTitle(
              title: '앱 개발 및 협업 문의',
              subtitle:
                  '문의는 소통총관제로 접수되어 검토·피드백·후속 지시까지 연계됩니다. '
                  '앱 아이디어, AI 기능, Flutter 개발, APK 테스트, Play Store 준비, '
                  'Promo 사이트 제작 관련 상담을 받을 수 있습니다.',
              light: true,
              center: true,
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.email_outlined,
                  color: PromoColors.goldLight,
                  size: 22,
                ),
                const SizedBox(width: 10),
                SelectableText(
                  PromoContact.email,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 14,
              runSpacing: 14,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => launchUrl(PromoContact.hubInquiryUri()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PromoColors.gold,
                    foregroundColor: PromoColors.deepNavy,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 18,
                    ),
                  ),
                  icon: const Icon(Icons.hub_outlined, size: 20),
                  label: const Text('소통총관제 상담 문의'),
                ),
                OutlinedButton.icon(
                  onPressed: () =>
                      launchUrl(PromoContact.hubCollaborationUri()),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: PromoColors.goldLight),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 18,
                    ),
                  ),
                  icon: const Icon(Icons.handshake_outlined, size: 20),
                  label: const Text('협업 · 아이디어 제안'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
