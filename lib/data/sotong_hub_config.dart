import 'package:flutter/material.dart';

import '../theme/promo_theme.dart';

/// 소통총관제 연동 흐름 — 앱개발 프로모 사이트 (실제 API 미연동)
class SotongHubConfig {
  SotongHubConfig._();

  static const String hubName = '소통총관제';
  static const String hubSubtitle = 'Sotong Central Command Hub';
  static const String siteLabel = 'SotongAppsPromo';

  static const flowSteps = [
    HubFlowStep(
      step: 1,
      title: '온라인 문의 접수',
      description: '앱개발·협업·AI 적용·Play Store 관련 문의가 홍보사이트와 이메일로 접수됩니다.',
      icon: Icons.edit_note_outlined,
      color: PromoColors.deepNavy,
    ),
    HubFlowStep(
      step: 2,
      title: '소통총관제 배정',
      description: '총관제에서 앱 포트폴리오·개발 단계·문의 유형별로 담당 채널에 배정합니다.',
      icon: Icons.hub_outlined,
      color: PromoColors.gold,
    ),
    HubFlowStep(
      step: 3,
      title: '피드백 · 상담 회신',
      description: '검토 결과, 개발 가능 범위, 일정·기술 제안에 대한 피드백을 전달합니다.',
      icon: Icons.forum_outlined,
      color: PromoColors.charcoal,
    ),
    HubFlowStep(
      step: 4,
      title: '총관제 지시 반영',
      description: '후속 미팅, APK 테스트, Promo 사이트 수정 등 총관제 지시에 따라 진행합니다.',
      icon: Icons.assignment_turned_in_outlined,
      color: PromoColors.goldLight,
    ),
  ];

  static const sampleTickets = [
    HubTicket(
      id: 'APP-2407-001',
      type: '앱 개발 상담',
      status: HubTicketStatus.received,
      summary: 'Flutter 기반 생활밀착 AI 앱 개발 검토',
    ),
    HubTicket(
      id: 'APP-2407-002',
      type: '협업 제안',
      status: HubTicketStatus.inReview,
      summary: '지역 서비스 앱 공동 기획·개발 협업 문의',
    ),
    HubTicket(
      id: 'APP-2407-003',
      type: '기술 문의',
      status: HubTicketStatus.feedback,
      summary: 'Play Store 출시 준비 및 APK 테스트 절차',
    ),
    HubTicket(
      id: 'APP-2407-004',
      type: 'Promo 연동',
      status: HubTicketStatus.instruction,
      summary: '앱 포트폴리오 홍보사이트 콘텐츠 업데이트 지시',
    ),
  ];

  static const sampleInstructions = [
    HubInstruction(
      title: '자료 보완 요청',
      description: '앱 와이어프레임·타깃 사용자·수익 모델 개요 전달',
    ),
    HubInstruction(
      title: '상담 일정 확정',
      description: '온라인 미팅 7/15 15:00 — AI 기능 범위 논의',
    ),
    HubInstruction(
      title: '개발 단계 지시',
      description: '1차 APK 내부 테스트 후 Promo 사이트 스크린샷 반영',
    ),
  ];
}

class HubFlowStep {
  const HubFlowStep({
    required this.step,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  final int step;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
}

enum HubTicketStatus {
  received('접수', PromoColors.deepNavy),
  inReview('검토중', PromoColors.gold),
  feedback('피드백', PromoColors.charcoal),
  instruction('지시반영', PromoColors.goldLight);

  const HubTicketStatus(this.label, this.color);
  final String label;
  final Color color;
}

class HubTicket {
  const HubTicket({
    required this.id,
    required this.type,
    required this.status,
    required this.summary,
  });

  final String id;
  final String type;
  final HubTicketStatus status;
  final String summary;
}

class HubInstruction {
  const HubInstruction({required this.title, required this.description});

  final String title;
  final String description;
}
