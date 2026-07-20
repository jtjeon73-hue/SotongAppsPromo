import 'package:flutter/material.dart';

import '../data/sample_apps_data.dart';
import '../layout/page_scaffold.dart';
import '../models/app_project.dart';
import '../theme/promo_theme.dart';
import '../widgets/section_title.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  static const _faqs = <({String q, String a})>[
    (
      q: '소통앱 프로모는 어떤 사이트인가요?',
      a:
          '소통웨어 앱개발 사업의 앱 포트폴리오를 소개하는 공식 프로모 사이트입니다. '
          '여행·건강·농촌·사주·AI 등 생활밀착형 앱의 방향과 진행 단계를 한곳에서 볼 수 있습니다.',
    ),
    (q: '앱 프로모 링크가 열리지 않아요.', a: promoDeployNotice),
    (
      q: '앱은 어떤 순서로 개발하나요?',
      a:
          '아이디어 정리 → 1차 UI 프로토타입 → 2차 고급화 → APK 테스트 → 프로모 사이트 → '
          'Play Store 준비 → 수익화 확장 순으로 단계적으로 진행합니다.',
    ),
    (
      q: '문의는 어디로 하면 되나요?',
      a:
          '문의하기 메뉴의 이메일($contactEmail)로 앱 개발·협업·Play Store 관련 문의를 보낼 수 있습니다. '
          '소통총관제 연동 흐름은 업데이트 소식 메뉴에서도 확인할 수 있습니다.',
    ),
    (
      q: '출시 앱과 개발 중인 앱의 차이는 무엇인가요?',
      a:
          '출시 앱은 프로모 사이트가 운영 중(운영중)인 앱입니다. '
          '개발 중인 앱은 제작 예정·준비 중 단계이거나 고도화·구상 단계의 앱입니다.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PageScaffoldBody(
      children: [
        SectionContainer(
          id: 'faq',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '자주 묻는 질문',
                subtitle: '소통앱 프로모와 앱 포트폴리오에 대해 자주 묻는 내용을 정리했습니다.',
              ),
              const SizedBox(height: 32),
              ..._faqs.map(
                (faq) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: PromoTheme.cardShadow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.help_outline_rounded,
                              color: PromoColors.gold,
                              size: 22,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                faq.q,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          faq.a,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(height: 1.65),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
