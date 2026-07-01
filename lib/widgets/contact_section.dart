import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../theme/promo_theme.dart';
import '../utils/url_helper.dart';
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
            const SectionTitle(
              title: '앱 개발 및 협업 문의',
              subtitle:
                  '앱 아이디어, 프로모 사이트, AI 기능 적용, Flutter 앱 개발, APK 테스트, '
                  'Play Store 준비와 관련된 문의를 받을 수 있습니다.',
              light: true,
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
                  contactEmail,
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: () =>
                  launchEmail(email: contactEmail, subject: '소통웨어 앱개발 문의'),
              style: ElevatedButton.styleFrom(
                backgroundColor: PromoColors.gold,
                foregroundColor: PromoColors.deepNavy,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 18,
                ),
              ),
              icon: const Icon(Icons.send_rounded, size: 20),
              label: const Text('이메일 문의하기'),
            ),
          ],
        ),
      ),
    );
  }
}
