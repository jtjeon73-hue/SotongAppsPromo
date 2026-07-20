import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sotong_apps_promo/app.dart';

void main() {
  testWidgets('홈과 사이드 메뉴가 정상적으로 로드된다', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(SotongAppsPromoApp());
    await tester.pumpAndSettle();

    expect(find.text('소통웨어 앱개발'), findsWidgets);
    expect(find.text('AI와 생활밀착 아이디어를 앱으로 만듭니다'), findsOneWidget);
    expect(find.text('앱 포트폴리오 보기'), findsOneWidget);
    expect(find.text('소통앱'), findsWidgets);
    expect(find.text('전체 앱'), findsWidgets);
    expect(find.text('문의하기'), findsWidgets);
  });

  testWidgets('모바일에서 햄버거 메뉴로 드로어가 열린다', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(SotongAppsPromoApp());
    await tester.pumpAndSettle();

    expect(find.byTooltip('메뉴 열기'), findsOneWidget);
    await tester.tap(find.byTooltip('메뉴 열기'));
    await tester.pumpAndSettle();

    expect(find.text('앱 개발 과정'), findsWidgets);
    expect(find.text('자주 묻는 질문'), findsWidgets);
  });
}
