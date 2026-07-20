import 'package:flutter/material.dart';

import 'navigation/app_router.dart';
import 'theme/promo_theme.dart';

class SotongAppsPromoApp extends StatelessWidget {
  SotongAppsPromoApp({super.key});

  final _router = createAppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '소통웨어 앱개발',
      debugShowCheckedModeBanner: false,
      theme: PromoTheme.lightTheme(),
      routerConfig: _router,
    );
  }
}
