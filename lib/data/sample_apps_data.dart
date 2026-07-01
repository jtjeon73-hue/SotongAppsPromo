import 'package:flutter/material.dart';

import '../models/app_category.dart';
import '../models/app_project.dart';
import '../theme/promo_theme.dart';

const String contactEmail = 'sotongware@naver.com';

const List<String> heroBadges = [
  'Flutter App',
  'AI Service',
  'Android APK',
  'Play Store 준비',
  'GitHub Pages Promo',
  '생활밀착 앱',
  '수익형 앱 개발',
];

const List<DevelopmentDirection> developmentDirections = [
  DevelopmentDirection(
    title: '생활에 바로 쓰는 앱',
    description: '여행, 건강, 농촌, 지역 생활처럼 실제 생활에 필요한 앱을 만듭니다.',
    icon: Icons.home_work_outlined,
  ),
  DevelopmentDirection(
    title: 'AI를 쉽게 쓰는 앱',
    description: '어려운 AI 기능을 일반 사용자도 쉽게 활용할 수 있는 화면으로 제공합니다.',
    icon: Icons.auto_awesome_outlined,
  ),
  DevelopmentDirection(
    title: '단계적으로 성장하는 앱',
    description: '1차 UI, 2차 고급화, APK 테스트, 프로모 사이트, Play Store 등록 순서로 확장합니다.',
    icon: Icons.trending_up_rounded,
  ),
  DevelopmentDirection(
    title: '앱과 홍보사이트 연결',
    description: '앱마다 개별 프로모 사이트를 만들어 사용자가 앱의 가치를 쉽게 이해하게 합니다.',
    icon: Icons.link_rounded,
  ),
  DevelopmentDirection(
    title: '수익화 가능성 고려',
    description: '광고, 유료 기능, 구독, 제휴, 콘텐츠 연계 등 수익모델을 고려합니다.',
    icon: Icons.payments_outlined,
  ),
  DevelopmentDirection(
    title: '계속 추가되는 앱 포트폴리오',
    description: '새 아이디어가 생기면 앱 카드와 프로모 링크를 계속 추가할 수 있는 구조입니다.',
    icon: Icons.apps_rounded,
  ),
];

const List<AppProject> sampleApps = [
  AppProject(
    name: '소통여행',
    englishName: 'SotongTravel',
    category: 'AI 여행 플래너',
    stage: '고급 UI 및 APK 테스트 준비',
    status: '개발 진행 중',
    description:
        '국내여행과 해외여행의 여행지, 일정, 숙소, 렌트카, 맛집, 관광지, 쇼핑, 준비물, 예상 비용을 '
        '한 번에 설계하는 AI 여행 플래너 앱입니다.',
    features: [
      '국내/해외 여행 구분',
      '도착/출발 시간 기반 일정 구성',
      '제주도 2박 3일 샘플 일정',
      '숙소/렌트카/맛집 추천 구조',
      '여행 예상 비용 산출',
      'APK 테스트 준비',
    ],
    nextStep: 'APK 테스트 및 프로모 사이트 연동',
    promoUrl: 'https://jtjeon73-hue.github.io/SotongTravelPromo/',
    hasPromoUrl: true,
    promoStatus: PromoStatus.live,
    buttonText: '소통여행 프로모 보기',
  ),
  AppProject(
    name: '소통사주',
    englishName: 'SotongSaju',
    category: '사주·궁합·AI 해석',
    stage: '기존 개발 경험 보유 / 고도화 예정',
    status: '고도화 예정',
    description: '생년월일, 사주, 궁합 정보를 바탕으로 기본 분석과 AI 해석을 제공하는 사주·궁합 앱입니다.',
    features: ['사주 기본 입력', '궁합 분석', 'AI 해석 구조', '리포트 확장 가능', '모바일 앱 고도화 예정'],
    nextStep: '고도화 및 프로모 사이트 제작',
    promoUrl: 'https://jtjeon73-hue.github.io/SotongSajuPromo/',
    hasPromoUrl: true,
    promoStatus: PromoStatus.planned,
    buttonText: '소통사주 프로모 링크',
  ),
  AppProject(
    name: '팜지기',
    englishName: 'Farmjigi',
    category: '농촌·직거래·지역 생활',
    stage: '농촌 직거래 앱 구상 / 기본 개발 경험 보유',
    status: '구상 단계',
    description: '농촌 생산물, 텃밭 작물, 지역 직거래, 마을 생활 정보를 연결하는 농촌 생활형 앱입니다.',
    features: [
      '농산물 직거래 구조',
      '지역 생산자 소개',
      '상품 등록 구조',
      '마을 생활 정보 확장',
      '스마트스토어/소통창고 연계 가능',
    ],
    nextStep: '직거래 UI 프로토타입',
    promoUrl: 'https://jtjeon73-hue.github.io/FarmjigiPromo/',
    hasPromoUrl: true,
    promoStatus: PromoStatus.planned,
    buttonText: '팜지기 프로모 링크',
  ),
  AppProject(
    name: '소통건강',
    englishName: 'SotongHealth',
    category: 'AI 건강코치',
    stage: '아이디어 기획 단계',
    status: '기획 단계',
    description: '생활습관, 증상 메모, 건강정보, 병원 방문 전 체크리스트를 정리해주는 AI 건강코치 앱입니다.',
    features: ['건강 메모', '생활습관 체크', '증상 기록', '병원 진료과 안내 구조', 'AI 건강정보 요약 예정'],
    nextStep: '기획서 및 1차 UI',
    promoUrl: 'https://jtjeon73-hue.github.io/SotongHealthPromo/',
    hasPromoUrl: true,
    promoStatus: PromoStatus.planned,
    buttonText: '소통건강 프로모 링크',
    cautionNote: '의료 진단 앱이 아니며, 건강정보 참고용 앱으로 기획합니다.',
  ),
  AppProject(
    name: '소통AI',
    englishName: 'SotongAI',
    category: 'AI 활용 플랫폼',
    stage: '앱 아이디어 구상',
    status: '아이디어 단계',
    description:
        '어려운 AI 도구를 쉽게 찾고, 비교하고, 실생활과 업무에 적용할 수 있도록 안내하는 AI 활용 플랫폼입니다.',
    features: [
      '유용한 AI 도구 소개',
      'AI 활용법 안내',
      '업무별 AI 추천',
      '수익자동화 아이디어 연결',
      '앱/콘텐츠/전자책 확장 가능',
    ],
    nextStep: '플랫폼 구조 설계',
    promoUrl: 'https://jtjeon73-hue.github.io/SotongAIPromo/',
    hasPromoUrl: true,
    promoStatus: PromoStatus.planned,
    buttonText: '소통AI 프로모 링크',
  ),
  AppProject(
    name: '소통사매',
    englishName: 'SotongSamae',
    category: '지역 생활·마을 정보',
    stage: '지역 홍보/프로모 경험 보유',
    status: '경험 보유',
    description: '지역 생활정보, 마을 소식, 관광지, 생활 편의 정보를 담을 수 있는 지역 밀착형 앱/서비스 구조입니다.',
    features: ['마을 정보', '관광지 소개', '생활정보', '지역 행사', '홍보사이트 연계'],
    nextStep: '지역 콘텐츠 구조 확장',
    promoUrl: 'https://jtjeon73-hue.github.io/SotongSamaePromo/',
    hasPromoUrl: true,
    promoStatus: PromoStatus.planned,
    buttonText: '소통사매 프로모 링크',
  ),
];

const List<AppCategory> appCategories = [
  AppCategory(
    title: 'AI 여행',
    description: '여행 일정, 비용, 추천을 AI로 설계하는 앱 영역',
    icon: Icons.flight_takeoff_rounded,
    accentColor: PromoColors.gold,
  ),
  AppCategory(
    title: '사주/운세',
    description: '사주, 궁합, AI 해석 기반 콘텐츠 앱 영역',
    icon: Icons.nights_stay_outlined,
    accentColor: PromoColors.goldLight,
  ),
  AppCategory(
    title: '농촌/직거래',
    description: '농산물, 지역 생산자, 마을 생활 연결 앱 영역',
    icon: Icons.agriculture_outlined,
    accentColor: PromoColors.gold,
  ),
  AppCategory(
    title: '건강관리',
    description: '생활습관, 건강 메모, AI 건강정보 앱 영역',
    icon: Icons.favorite_outline_rounded,
    accentColor: PromoColors.goldLight,
  ),
  AppCategory(
    title: 'AI 활용 플랫폼',
    description: 'AI 도구 소개, 비교, 활용 가이드 앱 영역',
    icon: Icons.hub_outlined,
    accentColor: PromoColors.gold,
  ),
  AppCategory(
    title: '지역 생활정보',
    description: '마을, 관광, 행사, 생활 편의 정보 앱 영역',
    icon: Icons.location_city_outlined,
    accentColor: PromoColors.goldLight,
  ),
  AppCategory(
    title: '수익자동화 도구',
    description: '콘텐츠, 제휴, 자동화 수익 연계 앱 영역',
    icon: Icons.monetization_on_outlined,
    accentColor: PromoColors.gold,
  ),
  AppCategory(
    title: '교육/전자책 연계 앱',
    description: '학습, 전자책, 콘텐츠 판매 연계 앱 영역',
    icon: Icons.menu_book_outlined,
    accentColor: PromoColors.goldLight,
  ),
];

const List<ProcessStep> processSteps = [
  ProcessStep(
    step: 1,
    title: '아이디어 정리',
    description: '생활 속 문제, 수익 가능성, 사용자 필요성을 기준으로 앱 아이디어를 정리합니다.',
  ),
  ProcessStep(
    step: 2,
    title: '1차 UI 프로토타입',
    description: 'Flutter로 핵심 화면과 메뉴 구조를 빠르게 만듭니다.',
  ),
  ProcessStep(
    step: 3,
    title: '2차 고급화',
    description: '디자인, 데이터 구조, 비용 계산, 추천 구조 등 실제 앱처럼 다듬습니다.',
  ),
  ProcessStep(
    step: 4,
    title: 'APK 테스트',
    description: 'Android APK를 만들어 휴대폰에서 직접 실행해 확인합니다.',
  ),
  ProcessStep(
    step: 5,
    title: '프로모 사이트 제작',
    description: '앱의 가치를 설명하는 개별 프로모 사이트를 GitHub Pages로 제작합니다.',
  ),
  ProcessStep(
    step: 6,
    title: 'Play Store 준비',
    description: '앱 아이콘, 개인정보처리방침, 패키지명, 빌드, 스토어 설명을 준비합니다.',
  ),
  ProcessStep(
    step: 7,
    title: '수익화 확장',
    description: '광고, 유료 기능, 구독, 제휴, 콘텐츠 연결 등 수익모델을 검토합니다.',
  ),
];

/// [sampleApps] 기반으로 프로모 링크 목록을 생성합니다.
List<PromoLink> get promoLinks => sampleApps
    .map(
      (app) => PromoLink(
        title: '${app.name} 프로모',
        url: app.promoUrl,
        promoStatus: app.promoStatus,
        hasPromoUrl: app.hasPromoUrl,
        buttonText: '프로모 보기',
      ),
    )
    .toList();

const List<MonetizationCard> monetizationCards = [
  MonetizationCard(
    title: '광고 기반 수익',
    description: '무료 앱 사용자 기반을 확보한 뒤 광고 수익을 검토합니다.',
    icon: Icons.campaign_outlined,
  ),
  MonetizationCard(
    title: '유료 기능',
    description: '상세 분석, 저장, PDF 리포트, 고급 추천 등 유료 기능을 검토합니다.',
    icon: Icons.star_outline_rounded,
  ),
  MonetizationCard(
    title: '구독 모델',
    description: '지속적으로 사용하는 AI 기능은 월 구독 구조로 확장할 수 있습니다.',
    icon: Icons.autorenew_rounded,
  ),
  MonetizationCard(
    title: '제휴/연결 수익',
    description: '여행, 쇼핑, 지역 상품, 콘텐츠, 전자책과 연결해 제휴 수익을 만들 수 있습니다.',
    icon: Icons.handshake_outlined,
  ),
  MonetizationCard(
    title: '콘텐츠 연계',
    description: '유튜브, 블로그, 전자책, 스마트스토어와 앱을 연결해 수익 흐름을 확장합니다.',
    icon: Icons.video_library_outlined,
  ),
];

const List<FutureIdea> futureIdeas = [
  FutureIdea(title: 'AI 건강코치', icon: Icons.health_and_safety_outlined),
  FutureIdea(title: 'AI 여행비 계산기', icon: Icons.calculate_outlined),
  FutureIdea(title: '농촌 직거래 도우미', icon: Icons.storefront_outlined),
  FutureIdea(title: '지역 행사 안내 앱', icon: Icons.event_outlined),
  FutureIdea(title: '전자책 판매 연동 앱', icon: Icons.import_contacts_outlined),
  FutureIdea(title: '스마트스토어 상품 도우미', icon: Icons.shopping_bag_outlined),
  FutureIdea(title: '산업자동화 현장 점검 앱', icon: Icons.engineering_outlined),
  FutureIdea(title: 'AI 업무지시 앱', icon: Icons.assignment_outlined),
];
