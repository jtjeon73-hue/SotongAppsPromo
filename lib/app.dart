import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'theme/promo_theme.dart';

class SotongAppsPromoApp extends StatelessWidget {
  const SotongAppsPromoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '소통웨어 앱개발',
      debugShowCheckedModeBanner: false,
      theme: PromoTheme.lightTheme(),
      home: const HomeScreen(),
    );
  }
}
