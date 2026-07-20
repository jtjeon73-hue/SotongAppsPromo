import 'package:flutter/material.dart';

import '../layout/page_scaffold.dart';
import '../widgets/section_title.dart';
import '../widgets/sotong_control_hub_section.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffoldBody(
      children: [
        SectionContainer(
          id: 'updates-intro',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(
                title: '업데이트 소식',
                subtitle:
                    '앱 개발·문의 흐름은 소통총관제 연동 예시로 확인할 수 있습니다. '
                    '별도 뉴스 피드는 준비 중이며, 아래는 현재 사이트에 반영된 운영 흐름입니다.',
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8EA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE8D5A3)),
                ),
                child: Text(
                  '준비 중: 앱별 출시·APK·프로모 업데이트 타임라인은 추후 이 메뉴에 정리됩니다.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        const SotongControlHubSection(),
      ],
    );
  }
}
