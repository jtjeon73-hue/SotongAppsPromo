/// 프로모 사이트 배포 상태
abstract final class PromoStatus {
  static const String live = '운영중';
  static const String planned = '제작 예정';
  static const String pending = '준비 중';
}

class AppProject {
  const AppProject({
    required this.name,
    required this.englishName,
    required this.category,
    required this.stage,
    required this.status,
    required this.description,
    required this.features,
    this.nextStep,
    this.promoUrl,
    this.hasPromoUrl = false,
    this.promoStatus = PromoStatus.pending,
    this.buttonText = '프로모 보기',
    this.cautionNote,
  });

  final String name;
  final String englishName;
  final String category;
  final String stage;
  final String status;
  final String description;
  final List<String> features;
  final String? nextStep;
  final String? promoUrl;
  final bool hasPromoUrl;
  final String promoStatus;
  final String buttonText;
  final String? cautionNote;

  bool get canOpenPromo =>
      hasPromoUrl && promoUrl != null && promoUrl!.trim().isNotEmpty;

  bool get isPromoLive => promoStatus == PromoStatus.live;

  bool get isPromoPlanned => promoStatus == PromoStatus.planned;
}

const String promoDeployNotice =
    '일부 프로모 사이트는 제작 예정이며, 배포 전에는 연결 주소가 열리지 않을 수 있습니다.';
