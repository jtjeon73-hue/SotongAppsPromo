import 'package:flutter/material.dart';

class NavItem {
  const NavItem({required this.label, required this.route, required this.icon});

  final String label;
  final String route;
  final IconData icon;
}

class NavGroup {
  const NavGroup({required this.label, required this.items});

  final String label;
  final List<NavItem> items;
}

abstract final class NavItems {
  static const List<NavGroup> groups = [
    NavGroup(
      label: '시작',
      items: [
        NavItem(label: '홈', route: '/', icon: Icons.home_outlined),
        NavItem(
          label: '소통앱 소개',
          route: '/about',
          icon: Icons.info_outline_rounded,
        ),
      ],
    ),
    NavGroup(
      label: '앱 포트폴리오',
      items: [
        NavItem(label: '전체 앱', route: '/apps', icon: Icons.apps_rounded),
        NavItem(
          label: '출시 앱',
          route: '/launched',
          icon: Icons.rocket_launch_outlined,
        ),
        NavItem(
          label: '개발 중인 앱',
          route: '/developing',
          icon: Icons.construction_outlined,
        ),
      ],
    ),
    NavGroup(
      label: '개발·안내',
      items: [
        NavItem(
          label: '주요 기능',
          route: '/features',
          icon: Icons.auto_awesome_outlined,
        ),
        NavItem(
          label: '앱 개발 과정',
          route: '/process',
          icon: Icons.timeline_outlined,
        ),
        NavItem(
          label: '업데이트 소식',
          route: '/updates',
          icon: Icons.campaign_outlined,
        ),
        NavItem(
          label: '자주 묻는 질문',
          route: '/faq',
          icon: Icons.help_outline_rounded,
        ),
      ],
    ),
    NavGroup(
      label: '문의',
      items: [
        NavItem(
          label: '문의하기',
          route: '/contact',
          icon: Icons.mail_outline_rounded,
        ),
      ],
    ),
  ];

  static NavItem? findByPath(String path) {
    for (final group in groups) {
      for (final item in group.items) {
        if (item.route == path) return item;
      }
    }
    return null;
  }

  static String titleForPath(String path) =>
      findByPath(path)?.label ?? '소통웨어 앱개발';
}
