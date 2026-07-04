class PromoContact {
  PromoContact._();

  static const String email = 'sotongware@naver.com';
  static const String subject = '[소통웨어 앱개발 문의]';
  static const String body = '''문의자 / 업체명 :

연락처 :

이메일 :

문의 분야 :

□ Flutter 앱 개발

□ AI 기능 적용

□ Android APK / Play Store

□ 홍보사이트(Promo) 제작

□ 앱 협업 / 아이디어 제안

□ 기타

문의 내용 :''';

  static Uri mailtoUri() {
    return Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: const {'subject': subject, 'body': body},
    );
  }

  static const String hubSubjectPrefix = '[소통총관제 접수]';
  static const String hubChannel = 'SotongAppsPromo 홍보사이트';

  static Uri hubInquiryUri() {
    return Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': '$hubSubjectPrefix 소통웨어 앱개발 상담 문의',
        'body':
            '''[소통총관제 연동 문의]
접수 채널: $hubChannel

문의자 / 업체명 :

연락처 :

문의 유형 : □ 앱 개발 상담  □ AI 적용  □ 협업  □ 기타

관심 앱 / 분야 :

문의 내용 :

---
※ 본 메일은 소통총관제 접수 흐름으로 처리됩니다.''',
      },
    );
  }

  static Uri hubCollaborationUri() {
    return Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': '$hubSubjectPrefix 앱 협업 · 아이디어 제안',
        'body':
            '''[소통총관제 연동 — 협업/아이디어]
접수 채널: $hubChannel

제안자 / 업체명 :

연락처 :

앱 아이디어 / 협업 방향 :

기대 일정 :

---
※ 소통총관제에서 검토 후 피드백·지시를 안내드립니다.''',
      },
    );
  }
}
