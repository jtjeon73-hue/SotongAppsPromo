import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../navigation/nav_items.dart';
import '../theme/promo_theme.dart';
import 'app_sidebar.dart';

/// PC(≥768): 고정 사이드바 + 본문
/// 모바일(<768): AppBar 햄버거 + Drawer
class AppShell extends StatefulWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  static const double desktopBreakpoint = 768;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = width >= AppShell.desktopBreakpoint;

    if (isDesktop) {
      return Scaffold(
        backgroundColor: PromoColors.beige,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppSidebar(),
            Expanded(child: widget.child),
          ],
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: PromoColors.beige,
      appBar: AppBar(
        backgroundColor: PromoColors.deepNavy,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          NavItems.titleForPath(location),
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
        ),
        leading: IconButton(
          tooltip: '메뉴 열기',
          icon: const Icon(Icons.menu_rounded),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: Drawer(
        width: AppSidebar.width,
        backgroundColor: PromoColors.deepNavy,
        child: AppSidebar(
          onNavigate: (route) {
            Navigator.of(context).maybePop();
            context.go(route);
          },
        ),
      ),
      body: widget.child,
    );
  }
}
