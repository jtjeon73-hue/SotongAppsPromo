# 소통웨어 앱개발 / SotongAppsPromo

소통웨어 앱개발 사업 **총괄 홍보사이트** — Flutter Web 기반 앱 포트폴리오 허브입니다.

## 목적

소통웨어에서 개발 중이거나 앞으로 개발할 앱들을 한곳에 모아 소개하고, 각 앱의 개별 프로모 사이트로 연결하는 **앱개발 사업 총괄 허브 사이트**입니다.

## 포함 앱

- 소통여행 / SotongTravel
- 소통사주 / SotongSaju
- 팜지기 / Farmjigi
- 소통건강 / SotongHealth
- 소통AI / SotongAI
- 소통사매 / SotongSamae
- 향후 추가 앱

## 주요 기능

- 앱 포트폴리오 소개
- 앱별 개발 상태 표시
- 개별 앱 프로모 사이트 연결
- 앱 개발 프로세스 소개
- 앱 수익화 방향 소개
- 이메일 문의 연결

## 연락처

sotongware@naver.com

## 실행 방법

```powershell
flutter pub get
flutter run -d chrome
```

## GitHub Pages 빌드 방법

```powershell
flutter clean
flutter pub get
dart format .
flutter analyze
flutter build web --base-href /SotongAppsPromo/
```

## docs 폴더 생성 방법

```powershell
Remove-Item -Recurse -Force docs -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path docs
Copy-Item -Path build/web/* -Destination docs -Recurse
New-Item -ItemType File -Path docs/.nojekyll -Force
```

## GitHub Pages 설정

1. GitHub 저장소 **Settings** → **Pages**
2. **Source**: Deploy from a branch
3. **Branch**: `main`
4. **Folder**: `/docs`
5. **Save**

## 배포 후 예상 주소

https://jtjeon73-hue.github.io/SotongAppsPromo/

## 배포 후 확인할 것

- 404 오류 여부
- CSS/폰트/이미지 적용 여부
- 모바일 반응형 여부
- 카카오톡 공유 미리보기
- 새로고침 정상 여부
- 소통여행 프로모 링크 정상 이동 여부

## 앱별 프로모 사이트 연결

- 소통여행: https://jtjeon73-hue.github.io/SotongTravelPromo/
- 소통사주: https://jtjeon73-hue.github.io/SotongSajuPromo/
- 팜지기: https://jtjeon73-hue.github.io/FarmjigiPromo/
- 소통건강: https://jtjeon73-hue.github.io/SotongHealthPromo/
- 소통AI: https://jtjeon73-hue.github.io/SotongAIPromo/
- 소통사매: https://jtjeon73-hue.github.io/SotongSamaePromo/

> **주의:** 각 개별 프로모 저장소가 아직 생성/배포되지 않은 경우 해당 링크는 404가 날 수 있습니다. 저장소를 만들고 GitHub Pages를 `/docs` 기준으로 배포하면 자동으로 연결됩니다.

## 앱별 프로모 링크 관리 방법

앱별 프로모 URL은 `lib/data/sample_apps_data.dart`의 `sampleApps` 목록에서 관리합니다.

```dart
AppProject(
  name: '앱이름',
  // ... 기타 필드 ...
  promoUrl: 'https://jtjeon73-hue.github.io/저장소이름/',
  hasPromoUrl: true,
  promoStatus: PromoStatus.live,      // 운영중
  // promoStatus: PromoStatus.planned, // 제작 예정
  buttonText: '앱이름 프로모 보기',
),
```

- `promoUrl`: GitHub Pages 예정/배포 주소
- `hasPromoUrl`: `true`이면 버튼 클릭 가능
- `promoStatus`: `PromoStatus.live`(운영중) / `PromoStatus.planned`(제작 예정) / `PromoStatus.pending`(준비 중)
- `promoLinks` 섹션은 `sampleApps`에서 자동 생성됩니다.

## 프로젝트 구조

```
lib/
├── main.dart
├── app.dart
├── theme/promo_theme.dart
├── models/
├── data/sample_apps_data.dart
├── screens/home_screen.dart
└── widgets/
```

## 기술 스택

- Flutter Web
- Google Fonts (Noto Sans KR)
- url_launcher (외부 링크, mailto)
