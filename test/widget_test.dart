import 'package:flutter_test/flutter_test.dart';

import 'package:sotong_apps_promo/app.dart';

void main() {
  testWidgets('앱이 정상적으로 로드된다', (WidgetTester tester) async {
    await tester.pumpWidget(const SotongAppsPromoApp());
    await tester.pumpAndSettle();

    expect(find.text('소통웨어 앱개발'), findsWidgets);
    expect(find.text('AI와 생활밀착 아이디어를 앱으로 만듭니다'), findsOneWidget);
    expect(find.text('앱 포트폴리오 보기'), findsOneWidget);
  });
}
